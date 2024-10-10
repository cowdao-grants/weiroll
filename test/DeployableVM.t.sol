// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.8.13;

import {DeployableVM} from "../src/DeployableVM.sol";
import {Test, console} from "forge-std/Test.sol";

contract DeployableVMTest is Test {
    DeployableVM public weiVm;

    function setUp() public {
        weiVm = new DeployableVM();
    }

    function test_reverts_if_not_delegatecall() public {
        bytes32[] memory commands = new bytes32[](0);
        bytes[] memory state = new bytes[](0);

        vm.expectRevert(DeployableVM.CallableOnlyViaDelegateCall.selector);
        weiVm.execute(commands, state);
    }

    function test_callable_via_delegatecall() public {
        bytes32[] memory commands = new bytes32[](0);
        bytes[] memory state = new bytes[](0);

        (bool success,) = address(weiVm).delegatecall(abi.encodeCall(DeployableVM.execute, (commands, state)));
        assertTrue(success);
    }
}
