// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo (@ethereumchile

pragma solidity >=0.7.0 <0.9.0;

contract PayableFunction {
    struct Bill {
        address payer;
        uint amount;
        uint date;
    }
    mapping(string => Bill) public bills;

    function payBill(string memory bill) public payable {
        // You can use 'require' with msg.value to validate if the amount is enough to pay the bill
        bills[bill].payer = msg.sender; // who pays the bill
        bills[bill].amount = msg.value; // amount sent by user
        bills[bill].date = block.timestamp; // current date
    }

    function checkPayment(string memory bill) public view returns (address, uint, uint) {
        Bill memory _bill = bills[bill];
        return (_bill.payer, _bill.amount, _bill.date);
    }
}