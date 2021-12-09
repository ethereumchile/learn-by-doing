// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo (@ethereumchile

pragma solidity >=0.7.0 <0.9.0;

contract PayableContract {
    receive() external payable {
        // if you use this please remember to create a withdraw function
    }
}