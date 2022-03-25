// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; //this is the version of the solidity we are using in this contract.

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol"; //this is given to us by hardhat to debug our code. It is very helpful in local environment.

contract SimpleNFT is ERC721URIStorage{ 
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
	
    constructor() ERC721("SimpleNFT","SIMPLE"){}

    function mintNFT() public returns (uint256){
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, "Hello World");
        console.log("The NFT ID %s has been minted to %s", newItemId, msg.sender);
        return newItemId;
    }   
}