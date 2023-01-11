// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/// @title ColourConverter
/// @author @codingwithmanny & @mannynarang
/// @notice Provides multiple functions for converting colors to different formats
library ColourConverter {
    // Constants
    bytes1 constant a = bytes1('a');
    bytes1 constant f = bytes1('f');
    bytes1 constant A = bytes1('A');
    bytes1 constant F = bytes1('F');
    bytes1 constant zero = bytes1('0');
    bytes1 constant nine = bytes1('9');

    int internal constant multiplyFactor = 10e18;

    /**
     * Code provided by github.com/themandalore - https://ethereum.stackexchange.com/questions/52847/parse-string-into-multiple-variables/53115#53115
     * Convert a character to its hex value as a byte. This is NOT
     * very efficient but is a brute-force way of getting the job done.
     * It's possible to optimize this with assembly in solidity but
     * that would require a lot more time.
     */
    function hexCharToByte(uint8 c) pure internal returns(uint8) {
        bytes1 b = bytes1(c);

        //convert ascii char to hex value
        if(b >= zero && b <= nine) {
            return c - uint8(zero);
        } else if(b >= a && b <= f) {
            return 10 + (c - uint8(a));
        }
        return 10 + (c - uint8(A));
    }

    /**
     * Code provided by github.com/themandalore - https://ethereum.stackexchange.com/questions/52847/parse-string-into-multiple-variables/53115#53115
     * Check whether a string has hex prefix.
     */
    function hasZeroXPrefix(string memory s) pure internal returns(bool) {
        bytes memory b = bytes(s);
        if(b.length < 2) {
            return false;
        }
        return b[1] == 'x';
    }

    /**
     * Code provided by github.com/themandalore - https://ethereum.stackexchange.com/questions/52847/parse-string-into-multiple-variables/53115#53115
     * Assumed that it accepts hex values without #
     */
    function hexToUint(string memory hexValue) pure public returns(uint) {
        //convert string to bytes
        bytes memory b = bytes(hexValue);

        //make sure zero-padded
        require(b.length % 2 == 0, "String must have an even number of characters");

        //starting index to parse from
        uint i = 0;
        //strip 0x if present
        if(hasZeroXPrefix(hexValue)) {
            i = 2;
        }
        uint r = 0;
        for(;i<b.length;i++) {
            //convert each ascii char in string to its hex/byte value.
            uint b1 = hexCharToByte(uint8(b[i]));

            //shift over a nibble for each char since hex has 2 chars per byte
            //OR the result to fill in lower 4 bits with hex byte value.
            r = (r << 4) | b1;
        }
        //result is hex-shifted value of all bytes in input string.
        return r;
    }

    /**
     * Inspired by Java code - unknown url but will find later
     * Converts a decimal value to a hex value without the #
     */
    function uintToHex (uint256 decimalValue) pure public returns (bytes memory) {
        uint remainder;
        bytes memory hexResult = "";
        string[16] memory hexDictionary = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];

        while (decimalValue > 0) {
            remainder = decimalValue % 16;
            string memory hexValue = hexDictionary[remainder];
            hexResult = abi.encodePacked(hexValue, hexResult);
            decimalValue = decimalValue / 16;
        }
        
        // Account for missing leading zeros
        uint len = hexResult.length;

        if (len == 5) {
            hexResult = abi.encodePacked("0", hexResult);
        } else if (len == 4) {
            hexResult = abi.encodePacked("00", hexResult);
        } else if (len == 3) {
            hexResult = abi.encodePacked("000", hexResult);
        } else if (len == 4) {
            hexResult = abi.encodePacked("0000", hexResult);
        }

        return hexResult;
    }

    /**
     * Inspired by Guffa's math - https://stackoverflow.com/questions/29241442/decimal-to-rgb-in-javascript-and-php/29241510#29241510
     * Returns a value between 0 and 255 for red
     */
    function intToRGBRed (uint256 decimalValue) pure public returns (int) {
        int red = int(decimalValue)/(256 * 256);
        return red;
    }

    /**
     * Inspired by Guffa's math - https://stackoverflow.com/questions/29241442/decimal-to-rgb-in-javascript-and-php/29241510#29241510
     * Returns a value between 0 and 255 for green
     */
    function intToRGBGreen (uint256 decimalValue) pure public returns (int) {
        int green = int(decimalValue)/256;
        return green % 256;
    }

    /**
     * Inspired by Guffa's math - https://stackoverflow.com/questions/29241442/decimal-to-rgb-in-javascript-and-php/29241510#29241510
     * Returns a value between 0 and 255 for blue
     */
    function intToRGBBlue (uint256 decimalValue) pure public returns (int) {
        return int(decimalValue % 256);
    }

    function rgbToHsl(int pR, int pG, int pB) public pure returns (int, int, int) {
        int r = pR * multiplyFactor / 255;
        int g = pG * multiplyFactor / 255;
        int b = pB * multiplyFactor / 255;

        int max = (r > g && r > b) ? r : (g > b) ? g : b;
        int min = (r < g && r < b) ? r : (g < b) ? g : b;

        int h;
        int s;
        int l = (max + min) / 2;

        if (max != min) {
            int d = max - min;
            s = (l > multiplyFactor/2) ? d*multiplyFactor / (2*multiplyFactor - max - min) : d*multiplyFactor / (max + min);
            
            if (r > g && r > b) {
                if (g < b) {
                    h = multiplyFactor * (g - b) / d + 6 * multiplyFactor;
                } else {
                    h = multiplyFactor * (g - b) / d; //x
                }
            } else if (g > b) {
                // h = (b - r) / d + 2.0f;
                h = multiplyFactor * (b - r) / d + 2*multiplyFactor; //x
            } else {
                h = multiplyFactor * (r - g) / d + 4*multiplyFactor; //x
            }
            h /= 6;
        }

        return (h, s, l);
    }

    function hslToRgb(int h, int s, int l) public pure returns (int, int, int) {
        int r;
        int g;
        int b;

        if (s == 0) {
            r = g = b = l; //x
        } else {
            int q = (l < multiplyFactor / 2) ? l * (multiplyFactor + s) / multiplyFactor : l + s - (l * s)/multiplyFactor; //x
            int p = 2 * l - q; //x

            r = hue2rgb(p, q, h + multiplyFactor/3); //x
            g = hue2rgb(p, q, h); //x
            b = hue2rgb(p, q, h - multiplyFactor/3); //x
        }

        r = r * 255*10/multiplyFactor;
        g = g * 255*10/multiplyFactor;
        b = b * 255*10/multiplyFactor;

        return (roundValue(r), roundValue(g), roundValue(b));
    }

    function hue2rgb(int p, int q, int t) public pure returns (int) {
        if (t < 0) {
            t += multiplyFactor;
        } 
        if (t > multiplyFactor) {
            t -= multiplyFactor;
        } 
        if (t < multiplyFactor/6) {
            return p + (q - p) * 6 * t / multiplyFactor; //x
        } 
        if (t < multiplyFactor/2) {
            return q; //x
        }
        if (t < 2*multiplyFactor/3) {
            return p + (q - p) * (2*multiplyFactor/3 - t) * 6 / multiplyFactor; //x
        }
        return p;
    }

    function roundValue(int value) public pure returns (int) {
        int remainder = value % 10;
        value /= 10;
        if (remainder < 5) {
            return value;
        } else {
            return value + 1;
        }
    }

    function interpolatebetweenTwovalues(int startInt, int endInt, int[2] memory percentages, int state) internal pure returns(int, int) {
        // int diff = startInt >= endInt ? startInt - endInt : endInt - startInt;

        // int smallerInt = startInt >= endInt ? endInt : startInt;

        // int256 newColour1Int = smallerInt + (diff * percentages[0] / 100);
        // int256 newColour2Int = smallerInt + (diff * percentages[1] / 100);

        int smallestGradient = 25 - (percentages[0] * (state+1)) / 12;
        int largestGradient = 75 + (percentages[1] * (state+1)) / 12;

        int diff = endInt - startInt;
        // int256 newColour1Int = startInt + (diff * percentages[0] / 100);
        // int256 newColour2Int = startInt + (diff * percentages[1] / 100);

        int256 newColour1Int = startInt + (diff * smallestGradient / 100);
        int256 newColour2Int = startInt + (diff * largestGradient / 100);

        return (newColour1Int, newColour2Int);
    }
}