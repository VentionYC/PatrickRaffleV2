// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {Script, console} from "forge-std/Script.sol";

contract HelperConfig is Script{
    uint256 public constant SEPOLIA_CHAIN_ID = 11155111;

    struct NetworkConfig {
        uint256 enterRaffleFee;
        uint256 interval;
        bytes32 gasLane;
        address vrfCoordinator;
        uint256 subscriptionId;
        bool useNativeTokenOrNot;
        address link;
        string privateKey;
    }

    //Using block ID to identify the network and using the active config
    NetworkConfig public activeNetWorkConfig;

    constructor(){
        console.log("The current chain id is ", block.chainid);
        if(block.chainid == SEPOLIA_CHAIN_ID){
            activeNetWorkConfig = getSepoliaEthConfig();
        }else{
            activeNetWorkConfig = getOrCreateLocalAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {

    }


    //one of the private key
    //account: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000.000000000000000000 ETH)
    //key: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80q
    function getOrCreateLocalAnvilEthConfig() public returns(NetworkConfig memory) {

    }


}