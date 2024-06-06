// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {Test, console} from "forge-std/Test.sol";
import {DeployRaffle} from "../script/DeployRaffle.s.sol";
import {Raffle} from "../src/Raffle.sol";

contract RaffleTest is Test{
    address public PLAYER   = makeAddr("PLAYER");
    uint256 public constant STARTING_BALANCE = 100 ether;
    Raffle private raffle;

    function setUp() external{
        //We have to init the raffle here
        //Or else we don't have the acces the funciton insdie the raffle contract
        
        vm.deal(PLAYER, STARTING_BALANCE);
        DeployRaffle deployRaffle = new DeployRaffle();

        raffle = deployRaffle.run();
    }

    function testRevertWithNotEnoughMoney() public {
        //I don't know how can I pretend the user to pay the enter fee?
        //You stupid, you do nothing equals don't pay the fee, you don't have to not pay enough, you just don't have to pay

        //Arrange
        vm.prank(PLAYER);

        //Act + assert
        vm.expectRevert(Raffle.Raffle_NotEnoughEnterFee.selector);
        raffle.enterRaffle();  
    }

    function testPlayerListIncreaseWhenPlayerEntered() public {
        //Arrange
        vm.prank(PLAYER);
        //We need getter function to get the list
        raffle.enterRaffle{value: 12 ether}();
        console.log("the length of the player list is " , raffle.getPlayerList().length);
        assert(raffle.getPlayerList().length != 0);
 
    }


    // modifier palyerEnterWithEnoughMoeny {
        
    // }
}
