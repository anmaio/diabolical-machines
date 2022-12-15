// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../../GridHelper.sol";
import "../../CommonSVG.sol";
import "./TestCypher1.sol";
import "./TestCypher2.sol";
import "./TestCypher3.sol";
import "./TestCypher4.sol";
import "./TestCypher5.sol";

interface ICypher {
  function generate(uint tokenId) external view returns (string memory);
}

contract CypherRoom {
  address internal constant CYPHER_CONTRACT = 0xdDA32aabBBB6c44eFC567baC5F7C35f185338456;

  string internal constant SIZE_OPEN = "<g transform='scale(0.2)'>";

  bytes internal constant floorGridArray = "312360156450000540468450312540156630624540468630312720";

  string internal constant background = "<rect width='640' height='640' fill='#090809'/>";

  function removeCypherBackground(string memory cypher, string memory backgroundToRemove) internal pure returns (string memory) {
    return replace(cypher, backgroundToRemove, "");
  }

  function pauseAnimations(string memory cypher) internal pure returns (string memory) {
    return replace(cypher, "dur=", "ddur=");
  }

  // https://gist.github.com/Vectorized/56ac210117f9baa15ac74a9ae779cd1f
  function replace(
        string memory subject,
        string memory search, 
        string memory replacement
    ) internal pure returns (string memory result) {
        assembly {
            let subjectLength := mload(subject)
            let searchLength := mload(search)
            let replacementLength := mload(replacement)

            // Store the mask for sub-word comparisons in the scratch space.
            mstore(0x00, not(0))
            mstore(0x20, 0)

            subject := add(subject, 0x20)
            search := add(search, 0x20)
            replacement := add(replacement, 0x20)
            result := add(mload(0x40), 0x20)

            let k := 0

            let subjectEnd := add(subject, subjectLength)
            if iszero(gt(searchLength, subjectLength)) {
                let subjectSearchEnd := add(sub(subjectEnd, searchLength), 1)
                for {} lt(subject, subjectSearchEnd) {} {
                    let o := and(searchLength, 31)
                    // Whether the first `searchLength % 32` bytes of 
                    // `subject` and `search` matches.
                    let l := iszero(and(xor(mload(subject), mload(search)), mload(sub(0x20, o))))
                    // Iterate through the rest of `search` and check if any word mismatch.
                    // If any mismatch is detected, `l` is set to 0.
                    for {} and(lt(o, searchLength), l) {} {
                        l := eq(mload(add(subject, o)), mload(add(search, o)))
                        o := add(o, 0x20)
                    }
                    // If `l` is one, there is a match, and we have to copy the `replacement`.
                    if l {
                        // Copy the `replacement` one word at a time.
                        for { o := 0 } lt(o, replacementLength) { o := add(o, 0x20) } {
                            mstore(add(result, add(k, o)), mload(add(replacement, o)))
                        }
                        k := add(k, replacementLength)
                        subject := add(subject, searchLength)
                    }
                    // If `l` or `searchLength` is zero.
                    if iszero(mul(l, searchLength)) {
                        mstore(add(result, k), mload(subject))
                        k := add(k, 1)
                        subject := add(subject, 1)
                    }
                }
            }

            let resultRemainder := add(result, k)
            k := add(k, sub(subjectEnd, subject))
            // Copy the rest of the string one word at a time.
            for {} lt(subject, subjectEnd) {} {    
                mstore(resultRemainder, mload(subject))
                resultRemainder := add(resultRemainder, 0x20)
                subject := add(subject, 0x20)
            }
            // Allocate memory for the length and the bytes, rounded up to a multiple of 32.
            mstore(0x40, add(result, and(add(k, 64), not(31))))
            result := sub(result, 0x20)
            mstore(result, k)
        }
    }

  function getCypher(uint tokenId) internal view returns (string memory) {
    ICypher cypher = ICypher(CYPHER_CONTRACT);
    return cypher.generate(tokenId);
  }

  function adjustCypher(string memory cypher) internal pure returns (string memory) {
    cypher = removeCypherBackground(cypher, background);
    cypher = pauseAnimations(cypher);
    return string.concat(SIZE_OPEN, cypher, "</g>");
  }

  function getMachine() external pure returns (string memory) {
    string memory baseCypher = string.concat(TestCypher1.getPart(), TestCypher2.getPart(), TestCypher3.getPart(), TestCypher4.getPart(), TestCypher5.getPart());
    baseCypher = removeCypherBackground(baseCypher, background);
    baseCypher = pauseAnimations(baseCypher);
    string memory reSized = string.concat(SIZE_OPEN, baseCypher, "</g>");
    string memory output = CommonSVG.groupTransform("-252", "-558", reSized);
    output = GridHelper.repeatGivenObject(output, 9, floorGridArray);
    return output;
  }
}