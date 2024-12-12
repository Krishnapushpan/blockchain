//SPDX-License-Identifier: MIT
import "./inheritance.sol";
pragma solidity 0.8.28;
contract Employee is Person{
    uint empID;
    function setEmployeeDetails(string memory _name,uint _age,uint _empID) public{
        setPerson(_name, _age);
        empID=_empID;
    }
    function getPersonDetails()public override view returns(string memory,uint){
        return (name,age);
    }
}