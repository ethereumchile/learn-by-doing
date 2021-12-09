// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo (@ethereumchile)

pragma solidity >=0.7.0 <0.9.0;

contract PayableAddress {
    address payable public wallet;

    constructor() {
        // Who creates the Smart Contract now is a payable address
        wallet = payable(msg.sender);
    }

    function validWithdraw() public returns (bool) {
        uint balance = address(this).balance; // Here we get the smart contract's balance
        // Avoid to use "transfer" or "send" method! 
        (bool sent, bytes memory _data) = wallet.call{value: balance}("");
        require(sent);
        return true;
    }

    function invalidWithdraw(address to) public returns (bool) {
        uint balance = address(this).balance;
        to.transfer(balance); // Error: "send" and "transfer" are only available for objects of type "address payable", not "address".
        return true;
    }
}
