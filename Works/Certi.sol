// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Cert {
    struct certificate{
        string name;
        string course;
        string grade;
        string date;
    }
    address admin;
    constructor(){
        admin=msg.sender;
    }
    modifier onlyAdmin(){
        require(msg.sender==admin,"unauthorized access");
        _;
    }
     mapping (uint256 _id=>certificate) public certificates;
     function issue(uint256 _id,
                    string memory _name,
                    string memory _course,
                    string memory _grade,
                    string memory _date) public onlyAdmin{
                     certificates[_id]=certificate(_name,_course,_grade,_date)   ;


     }
}