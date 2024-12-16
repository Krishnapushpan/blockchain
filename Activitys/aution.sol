// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Auction {
    struct bikeauction {
        string ownername; 
        string bike;       
        uint256 price;   
        address payable owneraddress;
    }

    address  admin = msg.sender; 
    mapping(uint256 => bikeauction) public bikeauctions; 
    
    //new bike for auction
    function issue(
        uint256 _id,
        string memory _ownername,
        string memory _bike,
        uint256 _price
    ) public {
        bikeauctions[_id] = bikeauction({
            ownername: _ownername,
            bike: _bike,
            price: _price,
            owneraddress: payable(msg.sender) // The issuer becomes the initial owner
        });
    }

    // update if the condition true
    function changeowner(
        uint256 _id,
        string memory _newownername
    ) public payable {
        bikeauction storage auction = bikeauctions[_id];

        require(msg.value > auction.price, "your price is lower than the current price.");

        // refund the previous owner fund
        if (auction.price > 0) {
            auction.owneraddress.transfer(auction.price);
        }

        // update the auction with the new owner details
        auction.ownername = _newownername;
        auction.price = msg.value;
        auction.owneraddress = payable(msg.sender);
    }
}
