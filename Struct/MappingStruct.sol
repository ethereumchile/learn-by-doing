// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo (@ethereumchile

pragma solidity >=0.7.0 <0.9.0;

contract Struct {
    struct Person {
        string name;
        uint age;
        uint weight;
    }

    mapping(address => Person) public persons;

    function createPerson(string memory name, uint age, uint weight) public returns (bool) {
        persons[msg.sender].name = name;
        persons[msg.sender].age = age;
        persons[msg.sender].weight = weight;
        return true;
    }

    function viewPerson(address addressPerson) public view returns (string memory, uint, uint) {
        Person memory person = persons[addressPerson];
        return (person.name, person.age, person.weight);
    }
}