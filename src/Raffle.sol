//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;
contract Raffle {
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
}