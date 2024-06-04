//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";
import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";

contract Raffle is VRFConsumerBaseV2Plus{
    //We have to store the Player enter the raffle
    //address[] payable private s_player;
    address payable[] private s_palyerList;
    uint256 private immutable i_miniEnterRaffleFee;
    constructor() {
        
    }

    //The main function should be player enter the raffle
      ////////////////////////////////////////////////////////////////////////////////////////////////
     // external button -> Pay the fee -> the function should be able to receive the fee -> payable//
    ////////////////////////////////////////////////////////////////////////////////////////////////
    function enterRaffle() external payable{
        if(msg.value < i_miniEnterRaffleFee) {

        }else {
            s_palyerList.push(payable(msg.sender));
        }
    }

    function getTheRequestIdAndKickOffRequestRandomWords() internal returns (uint256 requestId) {
        // Will revert if subscription is not set and funded.
        requestId = s_vrfCoordinator.requestRandomWords(
            VRFV2PlusClient.RandomWordsRequest({
                keyHash: keyHash,
                subId: s_subscriptionId,
                requestConfirmations: requestConfirmations,
                callbackGasLimit: callbackGasLimit,
                numWords: numWords,
                extraArgs: VRFV2PlusClient._argsToBytes(
                    VRFV2PlusClient.ExtraArgsV1({
                        nativePayment: enableNativePayment
                    })
                )
            })
        );
    }
}