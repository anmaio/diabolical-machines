// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "base64-sol/base64.sol";
import "./Metadata.sol";
import "./VRFv2SubscriptionManager.sol";
import "./TokenSwap.sol";

interface IWETH is IERC20 {
    function deposit() external payable;
    function withdraw(uint) external;
}


contract Clifford is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
	using Counters for Counters.Counter;

	Counters.Counter private _tokenIdCounter;
	// uint256 public maxSupply;
	// bool public saleComplete = false;
	Metadata private _metadata;

	bool public constant CHAINLINK = true;

	uint public currentLinkBalance = 0;
	uint public totalLinkNeeded = 0.5 * 10000 * 1e18; // 0.5 * 10k LINK
	uint public totalLinkSwapped = 0;
	// when link dips below this value go and swap some eth for link
	uint minimumLink = 20 * 1e18; // 20 Link

	address private weth = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;
	address private link = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;

	address private topUpAddress = msg.sender;

	LinkTokenInterface LINKTOKEN = LinkTokenInterface(link);

	TokenSwap private _tokenSwap;

	VRFv2SubscriptionManager private _VRF;

	constructor(Metadata metadata, TokenSwap tokenswap) ERC721("Clifford", "o") {
		_metadata = metadata;
    _tokenSwap = tokenswap;
	}

	function pause() public onlyOwner {
		_pause();
	}

	function unpause() public onlyOwner {
		_unpause();
	}

	function setTopUpAddress(address topUp) public onlyOwner {
		topUpAddress = topUp;
	}

	function setSubscriptionManager(VRFv2SubscriptionManager vrf) public onlyOwner {
		_VRF = vrf;
	}

	// Function to generate pseudo random number
	function randomNumber() public view returns (uint256) {
		uint256 number = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
		return number;
	}

    function wethToLink(uint balance) public {
        IWETH(weth).approve(address(_tokenSwap), balance);
        uint linkSwapped = _tokenSwap.swapExactInputSingle(balance);
        totalLinkSwapped += linkSwapped;
    }

    function convertToWeth(uint amount) public payable {
        uint256 eth = amount;
        IWETH(weth).deposit{value: eth}();
    }

    function getWethBalance() public view returns(uint) {
        return IWETH(weth).balanceOf(address(this));
    }

	function safeMint(address to) public payable {
		uint256 tokenId = _tokenIdCounter.current();
		_tokenIdCounter.increment();
		_safeMint(to, tokenId);
		if (CHAINLINK) {
			onMint(tokenId);
		} else {
			uint rand = randomNumber();
			_metadata.generateAllPositions(tokenId, rand);
		}
	}

    function onMint(uint _tokenId) internal {
        if (totalLinkSwapped < totalLinkNeeded) {
            convertToWeth(address(this).balance);
        } else if (LINKTOKEN.balanceOf(address(_VRF)) < minimumLink) { // 20 LINK
            convertToWeth(1 ether);
        }
        uint balance = IWETH(weth).balanceOf(address(this));
        if (balance > 0) {
            wethToLink(balance);
						uint linkBalance = LINKTOKEN.balanceOf(address(this));
            LINKTOKEN.transfer(address(_VRF), linkBalance);
						_VRF.topUpSubscription(linkBalance);
        }
        _VRF.requestRandomWords(_tokenId);
    }

	function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
		return _metadata.buildMetadata(_tokenId);
	}

	function _beforeTokenTransfer(
		address from,
		address to,
		uint256 tokenId
	) internal override(ERC721, ERC721Enumerable) whenNotPaused {
		super._beforeTokenTransfer(from, to, tokenId);
	}

	// The following functions are overrides required by Solidity.

	function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
		super._burn(tokenId);
	}

	function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
		return super.supportsInterface(interfaceId);
	}
}
