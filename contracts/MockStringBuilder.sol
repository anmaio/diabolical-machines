// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "base64-sol/base64.sol";
import "./Helper.sol";

contract MockStringBuilder {
    string[2] public data;

    // was 31
    string[155] public values = [
        // Small string tests
        // "a",
        // "b",
        // "c",
        // "d",
        // "e"
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}',
        '{"name": "Onion #" ',
        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
        '}, {"trait_type": "Trait 2", "value":',
        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
        '"}'
    ];

    function withoutSB(uint256 index) public {
        string memory str;

        for (uint256 i = 0; i < values.length; i++) {
            str = string(abi.encodePacked(str, values[i]));
        }

        // data[index] = Base64.encode(bytes(string(str)));
        data[index] = str;
    }

    function getWithoutSB() public view returns (string memory str) {
        for (uint256 i = 0; i < values.length; i++) {
            str = string(abi.encodePacked(str, values[i]));
        }

        // str = Base64.encode(bytes(string(str)));
    }

    function withSB(uint256 index) public {
        StringBuilder memory sb = SB.create(128 * 1024);

        for (uint256 i = 0; i < values.length; i++) {
            SB.writeStr(sb, string(abi.encodePacked(values[i])));
        }

        data[index] = SB.getString(sb);
    }

    function getWithSB() public view returns (string memory str) {
        StringBuilder memory sb = SB.create(128 * 1024);

        for (uint256 i = 0; i < values.length; i++) {
            SB.writeStr(sb, string(values[i]));
        }

        str = SB.getString(sb);
    }

    function withConcatBytes(uint256 index) public {
        bytes memory b;

        for (uint256 i = 0; i < values.length; i++) {
            b = bytes.concat(b, bytes(values[i]));
        }

        data[index] = string(b);
    }

    function getWithConcatBytes() public view returns (string memory str) {
        bytes memory b;

        for (uint256 i = 0; i < values.length; i++) {
            b = bytes.concat(b, bytes(values[i]));
        }

        str = string(b);
    }
}
