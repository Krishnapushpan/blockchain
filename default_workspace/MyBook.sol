//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract MyBook{
    string  title;
    uint16  price;
    address public owner;
    bool public sold;

    function getBook() public view returns(string memory ,uint16){
        return (title,price);
    }
    
   
    function setBook(string memory _title, uint16 _price) public{
        title =_title;
        price= _price;
        owner=msg.sender;
        sold=false;
    }
     function ethTowei(uint eval) public pure returns(uint){
        return(eval*1000000000000000000);
     }
     function BuyBook()public payable{
        if(msg.value >= ethTowei(price))
       {
         uint bal = msg.value- ethTowei(price);
         if(bal>0)
            payable (msg.sender).transfer(bal);
            owner = msg.sender;
            sold = true;
         }
       }
     }
