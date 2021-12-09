// SPDX-License-Identifier: GPL-3.0
// Author: Javier Guajardo (@ethereumchile

pragma solidity >=0.7.0 <0.9.0;

contract Struct {
    struct Person {
        string name;
        uint age;
        uint weight;
    }

    Person public person;

    constructor(){
        person.name = "Javier Guajardo";
        person.age = 28;
        person.weight = 70;
    }

    function viewPerson() public view returns (string memory, uint, uint) {
        return (person.name, person.age, person.weight);
    }
}