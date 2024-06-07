// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {Script, console} from "forge-std/Script.sol";

contract HelperConfig is Script{
    //Spolia testnet
    uint256 public constant SEPOLIA_CHAIN_ID = 11155111;
    address public constant SEPOLIA_VRF_2_5_COORDINATOR = 0x9DdfaCa8183c41ad55329BdeeD9F6A8d53168B1B;
    uint256 public constant SEPOLIA_VRF_2_5_GAS_LANE = 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae;
    uint256 public constant ANVIL_PRIVATE_KEY = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    struct NetworkConfig {
        uint256 enterRaffleFee;
        uint256 interval;
        bytes32 gasLane;
        address vrfCoordinator;
        uint256 subscriptionId;
        bool useNativeTokenOrNot;
        address link;
        uint256 privateKey;
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


    function getOrCreateLocalAnvilEthConfig() public returns(NetworkConfig memory) {

    }


}