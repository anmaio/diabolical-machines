// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "./Clifford.sol";

contract HandleRandom {
  // Minting Contract
  Clifford private _clifford;

  // Random number from oracle
  mapping(uint => uint) private _tokenToSeed;
  mapping(uint => uint) private _tokenToBaseRand;

  // Address of oracle
  address private _oracle = 0x0000000000000000000000000000000000000000;

  // Owner of the contract
  address private _owner;

  // Event to be emitted when a random number is requested
  event RequestRandomNumberEvent(uint256 tokenId);

  // Event to be emitted when a random number is received
  event ReceivedRandomNumberEvent(uint256 tokenId, uint256 randomNumber);

  // Event to be emitted when the oracle is set
  event OracleSetEvent(address oracle);

  constructor(Clifford clifford) { 
    _clifford = clifford;
    _owner = msg.sender;
  }

  // Check if the seed has been set for a token
  function seedSet(uint256 tokenId) public view returns (bool) {
    return _tokenToSeed[tokenId] != 0 && _tokenToSeed[tokenId] != 1;
  }

  // Get the random number for a token
  function getRandomNumber(uint tokenId) external view returns (uint rand) {
    uint seed = _tokenToSeed[tokenId];
    uint baseRand = _tokenToBaseRand[tokenId];
    uint number = uint(keccak256(abi.encodePacked(seed, baseRand)));
    return number;
  }

  // Request a random number from the oracle
  function requestSingleRandomNumber(uint tokenId) internal onlyMintingContract {
    require(_tokenToSeed[tokenId] == 0, "Seed already set");
    _tokenToBaseRand[tokenId] = uint(keccak256(abi.encodePacked(msg.sender, block.timestamp, block.difficulty)));
    // change seed to 1 to indicate that it has been requested
    // also will save us gas when writing the seed back to the contract from the oracle, non-zero->non-zero
    _tokenToSeed[tokenId] = 1;
    // Emit event to be picked up by oracle
    emit RequestRandomNumberEvent(tokenId);
  }

  function requestRandomNumbers(uint startingTokenId, uint amount) external onlyMintingContract {
    for (uint i = 0; i < amount;) {
      requestSingleRandomNumber(startingTokenId + i);
      unchecked {
        ++i;
      }
    }
  }

  // Fullfill the random number request from the oracle
  function fulfillRandomNumber(uint tokenId, uint randomNumber) external onlyOracle {
    _tokenToSeed[tokenId] = randomNumber;
    emit ReceivedRandomNumberEvent(tokenId, randomNumber);
  }

  function fullfillMultipleRandomNumbers(uint[] memory tokenIds, uint[] memory randomNumbers) external onlyOracle {
    require(tokenIds.length == randomNumbers.length, "TokenIds and RandomNumbers must be the same length");
    for (uint i = 0; i < tokenIds.length;) {
      _tokenToSeed[tokenIds[i]] = randomNumbers[i];
      emit ReceivedRandomNumberEvent(tokenIds[i], _tokenToSeed[tokenIds[i]]);
      unchecked {
        ++i;
      }
    }
  }

  // set the oracle
  function setOracle(address oracle) external onlyOwner {
    require(oracle != address(0), "Oracle cannot be the zero address");
    _oracle = oracle;
    emit OracleSetEvent(_oracle);
  }

  // Modifier to check if the caller is the oracle
  modifier onlyOracle() {
    require(msg.sender == _oracle, "Only oracle can call this function.");
    _;
  }

  // Modifier to check if the caller is the minting contract
  modifier onlyMintingContract() {
    require(msg.sender == address(_clifford), "Only minting contract can call this function.");
    _;
  }

  modifier onlyOwner() {
    require(msg.sender == _owner, "Only owner can call this function.");
    _;
  }
}