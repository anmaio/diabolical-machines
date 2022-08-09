// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

/*
    HIDEKI TSUKAMOTO | ANOMALOUS MATERIALS | 15.08.2021
______________.___.__________  ___ _______________________ 
\_   ___ \__  |   |\______   \/   |   \_   _____|______   \
/    \  \//   |   | |     ___/    ~    \    __)_ |       _/
\     \___\____   | |    |   \    Y    /        \|    |   \
 \______  / ______| |____|    \___|_  /_______  /|____|_  /
        \/\/                        \/        \/        \/ 
*/

struct CypherAttributes {
    uint256 colorset;
    int256 decay;
    int256 chaos;
    int256 utilRand;
    int256 numChannels;
    int256[8] density;
    int256[8] intricacy;
}

struct StringBuilder {
    bytes data;
}

library SB {
    function create(uint256 capacity) internal pure returns (StringBuilder memory) {
        return StringBuilder(new bytes(capacity + 32));
    }

    function resize(StringBuilder memory sb, uint256 newCapacity) internal view {
        StringBuilder memory newSb = create(newCapacity);

        assembly {
            let data := mload(sb)
            let newData := mload(newSb)
            let size := mload(add(data, 32)) // get used byte count
            let bytesToCopy := add(size, 32) // copy the used bytes, plus the size field in first 32 bytes

            pop(staticcall(gas(), 0x4, add(data, 32), bytesToCopy, add(newData, 32), bytesToCopy))
        }

        sb.data = newSb.data;
    }

    function resizeIfNeeded(StringBuilder memory sb, uint256 spaceNeeded) internal view {
        uint256 capacity;
        uint256 size;
        assembly {
            let data := mload(sb)
            capacity := sub(mload(data), 32)
            size := mload(add(data, 32))
        }

        uint256 remaining = capacity - size;
        if (remaining >= spaceNeeded) {
            return;
        }

        uint256 newCapacity = capacity << 1;
        uint256 newRemaining = newCapacity - size;
        if (newRemaining >= spaceNeeded) {
            resize(sb, newCapacity);
        } else {
            newCapacity = spaceNeeded + size;
            resize(sb, newCapacity);
        }
    }

    function getString(StringBuilder memory sb) internal pure returns (string memory) {
        string memory ret;
        assembly {
            let data := mload(sb)
            ret := add(data, 32)
        }
        return ret;
    }

    function writeStr(StringBuilder memory sb, string memory str) internal view {
        resizeIfNeeded(sb, bytes(str).length);

        assembly {
            let data := mload(sb)
            let size := mload(add(data, 32))
            pop(staticcall(gas(), 0x4, add(str, 32), mload(str), add(size, add(data, 64)), mload(str)))
            mstore(add(data, 32), add(size, mload(str)))
        }
    }

    function concat(StringBuilder memory dst, StringBuilder memory src) internal view {
        string memory asString;
        assembly {
            let srcData := mload(src)
            asString := add(srcData, 32)
        }

        writeStr(dst, asString);
    }

    function writeUint(StringBuilder memory sb, uint256 u) internal view {
        if (u > 0) {
            uint256 len;
            uint256 size;

            assembly {
                // get length string will be
                len := 0

                for {
                    let val := u
                } gt(val, 0) {
                    val := div(val, 10)
                    len := add(len, 1)
                } {

                }

                // get bytes currently used
                let data := mload(sb)
                size := mload(add(data, 32))
            }

            // make sure there's room
            resizeIfNeeded(sb, len);

            assembly {
                let data := mload(sb)

                for {
                    let i := 0
                    let val := u
                } lt(i, len) {
                    i := add(i, 1)
                    val := div(val, 10)
                } {
                    // sb.data[64 + size + (len - i - 1)] = (val % 10) + 48
                    mstore8(add(data, add(63, add(size, sub(len, i)))), add(mod(val, 10), 48))
                }

                size := add(size, len)

                mstore(add(data, 32), size)
            }
        } else {
            uint256 size;
            assembly {
                let data := mload(sb)
                size := mload(add(data, 32))
            }
            // make sure there's room
            resizeIfNeeded(sb, 1);

            assembly {
                let data := mload(sb)
                mstore(add(data, 32), add(size, 1))
                mstore8(add(data, add(64, size)), 48)
            }
        }
    }

    function writeInt(StringBuilder memory sb, int256 i) internal view {
        if (i < 0) {
            // write the - sign
            uint256 size;
            assembly {
                let data := mload(sb)
                size := mload(add(data, 32))
            }
            resizeIfNeeded(sb, 1);

            assembly {
                let data := mload(sb)
                mstore(add(data, 32), add(size, 1))
                mstore8(add(data, add(64, size)), 45)
            }

            // now the digits can be written as a uint
            i *= -1;
        }
        writeUint(sb, uint256(i));
    }

    function writeRgb(StringBuilder memory sb, uint256 col) internal view {
        resizeIfNeeded(sb, 6);

        string[16] memory nibbles = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"];

        string memory asStr = string(
            abi.encodePacked(
                nibbles[(col >> 20) & 0xf],
                nibbles[(col >> 16) & 0xf],
                nibbles[(col >> 12) & 0xf],
                nibbles[(col >> 8) & 0xf],
                nibbles[(col >> 4) & 0xf],
                nibbles[col & 0xf]
            )
        );

        writeStr(sb, asStr);
    }
}

struct Rand {
    uint256 value;
}

library Random {
    function create(uint256 srand) internal pure returns (Rand memory) {
        Rand memory rand = Rand({ value: srand });
        return rand;
    }

    function value(Rand memory rand) internal pure returns (uint256) {
        rand.value = uint256(keccak256(abi.encodePacked(rand.value)));
        return rand.value;
    }

    // (max inclusive)
    function range(
        Rand memory rand,
        int256 min,
        int256 max
    ) internal pure returns (int256) {
        if (min <= max) {
            uint256 span = uint256(max - min);

            return int256(value(rand) % (span + 1)) + min;
        } else {
            return range(rand, max, min);
        }
    }
}
