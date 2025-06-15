// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.8.27;

import {VM as WeirollVM} from "lib/enso-weiroll/contracts/VM.sol";

/**
 * @title DeployableVM for arbitrary contracts wanting to use Weiroll's VM.
 * @author CoW Protocol Developers
 * @dev This contract makes use of Enso's (enso.build) audited Weiroll VM contract available
 *      at: https://github.com/EnsoBuild/enso-weiroll. The original Weiroll is
 *      available at: https://github.com/weiroll/weiroll.
 */
contract DeployableVM is WeirollVM {
    error CallableOnlyViaDelegateCall();

    address private immutable WEIROLL_SINGLETON;

    constructor() {
        WEIROLL_SINGLETON = address(this);
    }

    function execute(bytes32[] calldata commands, bytes[] memory state) public payable returns (bytes[] memory) {
        // With the event of EIP-6780, we no longer have to guard against `SELFDESTRUCT`,
        // but the following check is added out of an abundance of caution in the event
        // the contract is deployed on a chain that does not support EIP-6780.
        require(address(this) != WEIROLL_SINGLETON, CallableOnlyViaDelegateCall());

        return _execute(commands, state);
    }
}
