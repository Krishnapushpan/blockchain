// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Auction {
    struct CarAuction {
        string ownerName; // Name of the current owner
        string car;       // Car name
        string model;     // Car model
        uint256 price;    // Current highest price
    }

    address public admin = msg.sender; // Admin of the contract
    mapping(uint256 => CarAuction) public carAuctions; // Auction data mapped by car ID

      

    // modifier onlyAdmin() {
    //     require(msg.sender == admin, "Unauthorized");
    //     _;
    // }


    // Function to issue a new car for auction
    function issue(
        uint256 _id,
        string memory _ownerName,
        string memory _car,
        string memory _model,
        uint256 _price
    ) public  {
     
        carAuctions[_id] = CarAuction(_ownerName, _car, _model, _price);
    }

    // Function to participate in the auction and update ownership if conditions are met
    function changeOwner(
        uint256 _id,
        string memory _newOwnerName,
        uint256 _newPrice
    ) public payable  {
        CarAuction storage auction = carAuctions[_id];
                if  (msg.value > auction.price)
                    {payable (msg.sender).transfer(auction.price);
                    
                    auction.ownerName = _newOwnerName;
                    auction.price = _newPrice;
                    admin=msg.sender;
                
            }
      
        
    }
    }

