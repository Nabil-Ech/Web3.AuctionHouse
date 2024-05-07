//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Cars is ERC721URIStorage {
    // to count the number of nft minted / cars listed
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    // we need to call the erc721 constroctor to use its functions
    constructor () ERC721("Car", "CR") {}
    // our function mint uses _mint funtion from erc721
    function mint(string memory _tokenURI) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        return newItemId;
        
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }
}