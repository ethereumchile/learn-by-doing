// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo (@ethereumchile

pragma solidity >=0.7.0 <0.9.0;

// Smart Contract to create a "pay per use" service
contract Events {
    address payable public owner;
    mapping(address => bool) public users;
    event Registered(address indexed account, uint256 indexed date);
    event Removed(address indexed account, uint256 indexed date);
    event Deposit(address indexed account, uint256 indexed date, uint256 amount);
    event Withdraw(address indexed account, uint256 indexed date, uint256 amount);

    modifier onlyNotUsers() {
        require(!users[msg.sender], "Error! You're already user");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You must be the owner");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
        emit Registered(msg.sender, block.timestamp);
    }

    receive() external payable onlyNotUsers {
        require(msg.value == 1 ether, "Deposit must be equal to 1 ether");
        users[msg.sender] = true;
        emit Deposit(msg.sender, block.timestamp, msg.value);
        emit Registered(msg.sender, block.timestamp);
    }

    function removeAccount(address account) public onlyOwner {
        delete users[account];
        emit Removed(account, block.timestamp);
    }

    function withdraw(uint256 amount) public onlyOwner {
        (bool sent, bytes memory data) = owner.call{value: amount}("");
        require(sent);
        emit Withdraw(owner, block.timestamp, amount);
    }
}
