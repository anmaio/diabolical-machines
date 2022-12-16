// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "./Clifford.sol";

contract HandleRandom {
  // Minting Contract
  Clifford private _clifford;

  // Random number from oracle
  mapping(uint => uint) internal _tokenToSeed;
  mapping(uint => uint) internal _tokenToBaseRand;

  // Address of oracle
  address internal _oracle = 0x0000000000000000000000000000000000000000;

  // Owner of the contract
  address internal _owner;

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
  function getRandomNumber(uint _tokenId) external view returns (uint rand) {
    uint seed = _tokenToSeed[_tokenId];
    uint baseRand = _tokenToBaseRand[_tokenId];
    uint number = uint(keccak256(abi.encodePacked(seed, baseRand)));
    return number;
  }

  // Request a random number from the oracle
  function requestRandomNumber(uint _tokenId) external onlyMintingContract {
    require(_tokenToSeed[_tokenId] == 0, "Seed already set");
    _tokenToBaseRand[_tokenId] = uint(keccak256(abi.encodePacked(msg.sender, block.timestamp, block.difficulty)));
    // change seed to 1 to indicate that it has been requested
    // also will save us gas when writing the seed back to the contract from the oracle, non-zero->non-zero
    _tokenToSeed[_tokenId] = 1;
    // Emit event to be picked up by oracle
    emit RequestRandomNumberEvent(_tokenId);
  }

  // Fullfill the random number request from the oracle
  function fulfillRandomNumber(uint _tokenId, uint _randomNumber) external onlyOracle {
    _tokenToSeed[_tokenId] = _randomNumber;
    emit ReceivedRandomNumberEvent(_tokenId, _tokenToSeed[_tokenId]);
  }

  function fullfillMultipleRandomNumbers(uint[] memory _tokenIds, uint[] memory _randomNumbers) external onlyOracle {
    require(_tokenIds.length == _randomNumbers.length, "TokenIds and RandomNumbers must be the same length");
    for (uint i = 0; i < _tokenIds.length; i++) {
      _tokenToSeed[_tokenIds[i]] = _randomNumbers[i];
      emit ReceivedRandomNumberEvent(_tokenIds[i], _tokenToSeed[_tokenIds[i]]);
    }
  }

  // set the oracle
  function setOracle(address oracle) external onlyOwner {
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