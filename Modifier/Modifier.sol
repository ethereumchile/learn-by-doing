// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo J. (twitter: @ethereumchile)

pragma solidity >=0.7.0 <0.9.0;

contract Modifier {
    address public administrator;
    uint256 public balance;

    modifier checkConditionFirst() {
        require(msg.sender == administrator, "You're not administrator");
        _;
    }

    function addBalanceWithModifier(uint256 amount) public checkConditionFirst returns (uint256) {
        balance = balance + amount;
        return balance;
    }

    function addBalanceWithoutModifier(uint256 amount) public returns (uint256) {
        require(msg.sender == administrator, "You're not administrator");
        balance = balance + amount;
        return balance;
    }
}
