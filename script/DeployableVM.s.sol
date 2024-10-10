// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.8.13;

import {DeployableVM} from "../src/DeployableVM.sol";
import {Script, console} from "forge-std/Script.sol";

contract DeployableVMScript is Script {
    DeployableVM public weiVm;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // Use deterministic salt to deploy the contract.
        weiVm = new DeployableVM{salt: ""}();

        vm.stopBroadcast();
    }
}
