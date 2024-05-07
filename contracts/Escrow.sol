// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
interface IERC721 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _id
    ) external;
}

contract Escrow {
    address public  inspector;
    address public  lender;
    address public  nftAddress;
    address payable public seller;
    mapping (uint256=>bool) public  islisted;
    mapping (uint256=>uint256) public  Stating_bid;
    mapping (uint256=>uint256) public  Down_payment;
    
    constructor(address _nftaddress,
                address _lender,
                address payable _seller,
                address _inspector
                ) 
    {
        inspector = _inspector;
        seller = _seller;
        lender = _lender;
        nftAddress = _nftaddress;
    }
    
    function list (uint256 _nftID, uint256 starting_bid, uint256 down_payment) public payable {
        // once listed, the seller is no longer in position of his car(nft), it gwts transfered to the escrow 
        IERC721(nftAddress).transferFrom(msg.sender, address(this), _nftID);  
        
        // trqcking infos about the listed car
        islisted[_nftID]=true;
        Stating_bid[_nftID]=starting_bid;
        Down_payment[_nftID=down_payment];

    }

    

    

    
    
}
