# Overview

This repo is for the diabolical machines on chain NFT collection.

The repo contains svg strings and logic for composing them, this makes up the majority of the 4900 lines of code. It also introduces a few concepts that have been implemented in a novel way such the auction and the rarity model

# Technical Documentation

You can find a notion page with in depth technical documentation [here](https://atlantic-patient-51c.notion.site/Diabolical-Machines-b67ef3c9c76c4b7cb84ea4dfc377636a)

# Contract Structure - High Level

Clifford.sol - Main contract that has the mint function and auction.

Metadata.sol - Responsable for the high level assembly of the SVG strings and metadata composition.

Machine.sol - Contains the logic for selecting a machine/workstation and the logic for retrieved that machine based on a given random seed.

GridHelper.sol - A library containing various helper functions used througout many contracts.

Patterns.sol - Selection logic for which pattern to use and what values parameters should be set to.

Environment.sol - Selection logic for the colour palette

GlobalNumbers.sol - Selection logic for assets that can be used globally regardless of workstation, also contains positioning logic for some of these assets.

Noise.sol - Noise arrays that are used throught to determine how varied the output should be.

CommonSVG.sol - Mix of composition logic for graidents, patterns and shell

GlobalSVG.sol - Composition logic for <style> and <defs> tags needed for the svg. It also adds other svg section that are needed such as wether the diorama is flipped and colours/patterns

AssetRetreiver.sol - Starting point for retrieving an svg string based of an index. This contract should be able to retrieve any svg as long as the index is correct. It can recieve and index of 0 but in this scenario should return an empty string.

TraitBase.sol - Contains the logic for retrieving a certain category of asset, for example with eyes there is a TraitBase contract that can return any of the eyes svg string. Any Traitbase contract should only ever be called by AssetRetreiver.sol

# Useful/common commands

### Test with optimizer 
forge test --via-ir --gas-report  -vvvv --optimize --optimizer-runs 1000
### Match test
forge test --match-contract Clifford --match-test testAuctionSimulator -vvvv
### Deploy to localhost 
forge script script/Clifford.s.sol:CliffordScript --rpc-url http://localhost:8545 --broadcast -vvv
### Deploy to Goerli 
forge script script/Clifford.s.sol:CliffordScript --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvvv
### Slither overview
slither ./src/Clifford.sol --print human-summary
