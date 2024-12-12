//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Bank{
    mapping(address=>uint)balanceLedger;
    address public admin;
    constructor(){
        admin=msg.sender;
    }
    modifier balanceCheck(uint amt) {
        require(balanceLedger[msg.sender]>=amt,"insufficient balance");
        _;
    }
    function deposit()public payable{
        balanceLedger[msg.sender]=balanceLedger[msg.sender]+msg.value;
    }
    function getBalance()public view returns(uint){
        return balanceLedger[msg.sender];
    }
    function withdraw(uint amt) public balanceCheck(amt) {
        balanceLedger[msg.sender]=balanceLedger[msg.sender]-amt;
        payable (msg.sender).transfer(amt);
    }
    function transfer(uint amt,address recipient ) public  balanceCheck(amt) payable {
        balanceLedger[msg.sender]=balanceLedger[msg.sender]-amt;
        payable (recipient).transfer(amt);
    }
}