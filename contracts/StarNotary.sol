// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;
//Importing openzeppelin-solidity ERC-721 implemented Standard
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract StarNotary is ERC721('AntonioStar', 'AST'){

    struct Star {
        string name;
    }

    mapping(uint256 => Star) public tokenIdStarInfo;
    mapping(uint256 => uint256) public starsForSale;

    function createStar(string memory _name, uint256 _tokenId) public { //Passing the name and tokeId as parameters
        Star memory newStar = Star(_name); //Star is a struc so we are creating a new star
        tokenIdStarInfo[_tokenId] = newStar; // Creating in memory the Star -> tokeId mapping 
        _safeMint(msg.sender, _tokenId); // _mint assign the star with the _tokenId to the sender address (ownership)
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender);  //You cant sell a star you dont owe 

        starsForSale[_tokenId] = _price;
    }

    function _make_payable(address x) internal pure returns(address payable){
        return address(uint160(x));
    }

     function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale");
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        require(msg.value > starCost, "You need to have enough Ether");
        _transfer(ownerAddress, msg.sender, _tokenId);
        address payable ownerAddressPayable = _make_payable(ownerAddress);
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
    }

}