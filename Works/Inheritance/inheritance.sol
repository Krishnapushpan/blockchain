//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Person {
    string name;
    uint age;
    function getPersonDetails() public virtual view returns(string memory,uint){
        return (name,age);
    }
    function setPerson(string memory _name,uint _age)public {
        name=_name;
        age=_age;
    }
    function onlyParent()private{
        
    }
}