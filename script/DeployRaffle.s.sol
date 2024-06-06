// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";

contract DeployRaffle is Script {
    constructor() {
        
    }

    function run() public returns(Raffle){

        vm.startBroadcast();
        //With the real subId, we don't have to have the scrip to -> Create-> Fund
        //But we have to add the consumer, right?
            Raffle raffle = new Raffle(
                10 ether,
                10,
                0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae,
                0x9DdfaCa8183c41ad55329BdeeD9F6A8d53168B1B,
                17567876347256142007997470531990983328881883535997831679022352995396763935343,
                false
            );

            console.log("Raffle deployed at:", address(raffle));
        vm.stopBroadcast();

        return raffle;
    }

}