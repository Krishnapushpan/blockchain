// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBook {
    struct Book {
        string title;
        uint16 price;
        address payable owner;
        bool sold;
    }

    // Array to store books
    Book[] public books;

    // Function to get details of a specific book by its index
    function getBook(uint index) public view returns (string memory, uint16, address, bool) {
        require(index < books.length, "Book does not exist");
        Book memory book = books[index];
        return (book.title, book.price, book.owner, book.sold);
    }

    // Function to add a book to the array
    function setBook(string memory _title, uint16 _price) public {
        require(books.length < 10, "Cannot add more than 10 books");
        books.push(Book({
            title: _title,
            price: _price,
            owner: payable(msg.sender),
            sold: false
        }));
    }

    // Function to convert Ether to Wei (1 Ether = 1e18 Wei)
    function ethTowei(uint eval) public pure returns (uint) {
        return eval * 1000000000000000000;
    }

    // Function to buy a book
    function buyBook(uint index) public payable {
        require(index < books.length, "Book does not exist");
        
        Book storage book = books[index];
        
        // Ensure the book is not sold yet
        require(!book.sold, "This book is already sold");

        // Ensure sufficient Ether is sent
        require(msg.value >= ethTowei(book.price), "Insufficient funds to buy this book");

        // Refund any extra funds sent
        uint bal = msg.value - ethTowei(book.price);
        if (bal > 0) {
            payable(msg.sender).transfer(bal);  // Refund excess money to buyer
        }

        // Update book ownership and sold status
        book.owner = payable(msg.sender);  // Transfer ownership to the buyer
        book.sold = true;  // Mark the book as sold
    }

    // Function to get the total number of books
    function getBookCount() public view returns (uint) {
        return books.length;
    }
}
