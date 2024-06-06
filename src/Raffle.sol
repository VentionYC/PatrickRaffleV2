//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";
import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";

contract Raffle is VRFConsumerBaseV2Plus{

    error Raffle_NotEnoughEnterFee();
    
    ///////////////////
    //BASIC PARAMETER//
    ///////////////////
    address payable[] private s_palyerList;
    uint256 private immutable i_miniEnterRaffleFee;

    //VRF PARAMETER
    uint256 private i_subscriptionId;
    bytes32 private immutable i_keyHashForGasLane;
    uint32 private constant NUMWORDS = 1;
    uint16 private constant REQUEST_CONFIRMATION = 3;
    uint32 private constant GASLIMIT = 500000;
    bool private immutable i_useNativeTokenOrNot;

    //Automation(Keeper) PARAMETER
    uint256 private immutable i_interval;


    //Block Time
    uint256 private s_timestamp;


    //Value will pass from the SCRIPT based from diff network
    //2.0 vs 2.5, as long as we pass the right vrf here, we don't have to init ourself, straight use "s_vrfCoordinator"(my guess)
    constructor(uint256 enterRaffleFee, 
                uint256 interval, 
                bytes32 gasLane, 
                address vrfCoordinator, 
                uint256 subscriptionId, 
                bool useNativeTokenOrNot)
                VRFConsumerBaseV2Plus(vrfCoordinator) {
                    
                i_miniEnterRaffleFee = enterRaffleFee;
                i_interval = interval;
                i_keyHashForGasLane = gasLane;
                i_subscriptionId = subscriptionId;
                i_useNativeTokenOrNot = useNativeTokenOrNot;

                s_timestamp = block.timestamp;

        
    }


        /////////////////////
       // MAIN ENTER POINT// 
      ////////////////////////////////////////////////////////////////////////////////////////////////
     // external button -> Pay the fee -> the function should be able to receive the fee -> payable//
    ////////////////////////////////////////////////////////////////////////////////////////////////
    function enterRaffle() external payable{
        if(msg.value < i_miniEnterRaffleFee) {
            revert Raffle_NotEnoughEnterFee();
        }else {
            s_palyerList.push(payable(msg.sender));
        }
    }

    function getTheRequestIdAndKickOffRequestRandomWords() internal returns (uint256 requestId) {
        // Will revert if subscription is not set and funded.
        requestId = s_vrfCoordinator.requestRandomWords(
            VRFV2PlusClient.RandomWordsRequest({
                keyHash: i_keyHashForGasLane,
                subId: i_subscriptionId,
                requestConfirmations: REQUEST_CONFIRMATION,
                callbackGasLimit: GASLIMIT,
                numWords: NUMWORDS,
                extraArgs: VRFV2PlusClient._argsToBytes(
                    VRFV2PlusClient.ExtraArgsV1({
                        nativePayment: i_useNativeTokenOrNot
                    })
                )
            })
        );
    }

    function fulfillRandomWords(uint256 requestId, uint256[] calldata randomWords) internal override{
        
    }

    //getter function for testing the player list
    function getPlayerList() public view returns (address payable[] memory) {
        return s_palyerList;
    }
}