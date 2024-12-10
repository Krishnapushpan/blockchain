// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MYBOOKS {
    struct mybook {    
        string  title;
        uint16  price; 
        address payable buyerad;
        address payable sellerad;
    }

    mybook public book;

    function getBook() public view returns (string memory, uint16, address payable, address payable) {
        return (book.title, book.price, book.buyerad, book.sellerad);
    }

    function setBook(string memory _title, uint16 _price, address payable _sellerad) public {
        book.title = _title;
        book.price = _price;
        book.sellerad = _sellerad;
        book.buyerad = payable(address(0)); 
    }


    function ethTowei(uint eval) public pure returns (uint) {
        return eval * 1000000000000000000; 
    }

    function paybook() public payable {
        uint bookPriceInWei = ethTowei(book.price);
        if (msg.value < bookPriceInWei) {

            payable(msg.sender).transfer(msg.value);
            revert("Insufficient funds: Amount refunded");
        }

        require(book.sellerad != address(0), "Seller address is not set");

        book.sellerad.transfer(bookPriceInWei);

        book.buyerad = payable(msg.sender);

        if (msg.value > bookPriceInWei) {
            uint excessAmount = msg.value - bookPriceInWei;
            payable(msg.sender).transfer(excessAmount);
        }
    }
}
