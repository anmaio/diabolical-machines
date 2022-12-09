// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Auction {
    // Initialize variables
    uint256 round = 1;
    uint256 numItems;
    uint256 startPrice;
    uint256 numBuyers;
    mapping(uint256 => mapping(string => uint256)) bidders;

    event AuctionEnded(uint256 itemsRemaining);
    event RoundEnded(uint256 round, uint256 itemsRemaining);

    constructor(uint256 _numItems, uint256 _startPrice, uint256 _numBuyers) public {
        numItems = _numItems;
        startPrice = _startPrice;
        numBuyers = _numBuyers;
    }

    function simulateAuction() public {
        // Continue until all items are sold or the price reaches 0
        while (numItems > 0 && startPrice > 0) {
            // Check if it is possible to advance to the next round without exceeding the number of items
            if (numItems < startPrice) {
                // Print the number of items remaining and end the auction
                emit AuctionEnded(numItems);
                return;
            }

            // Increase the rewards and number of items for bidders who have bid in previous rounds
            for (uint256 i = 0; i < numBuyers; i++) {
                if (bidders[i]["items"] != 0) {
                    bidders[i]["items"] *= 2;
                    bidders[i]["reward"] *= 2;
                }
            }

            // Loop over each buyer and simulate their actions
            for (uint256 i = 0; i < numBuyers; i++) {
                // Generate a random number between 0 and 1
                uint256 randNum = uint256(uint256(keccak256(abi.encodePacked(block.timestamp, i))) % 2);

                // If the random number is 0, the buyer buys in
                if (randNum == 0) {
                    // Generate a random integer between 1 and 3 to determine how many items the buyer buys
                    uint256 itemsBought = uint256(uint256(keccak256(abi.encodePacked(block.timestamp, i, round))) % 3) + 1;

                    // Calculate the "early bidders" reward for the current round
                    uint256 reward = itemsBought * 2 ** round;
                    // If the buyer has already bid in previous rounds,
                // update their number of items and reward
                if (bidders[i]["items"] != 0) {
                    itemsBought += bidders[i]["items"];
                    reward += bidders[i]["reward"];
                }

                // Update the number of items remaining
                numItems -= itemsBought;

                // Check if the number of items remaining is 0 and end the round if it is
                if (numItems == 0) {
                    break;
                }

                // Save the current number of items and reward for the buyer
                bidders[i]["items"] = itemsBought;
                bidders[i]["reward"] = reward;
            }
        }

        // Print the current round and number of items remaining
        emit RoundEnded(round, numItems);

        // Update the starting price and round number
        startPrice = startPrice / 2;
        round += 1;
        }
    }
}
