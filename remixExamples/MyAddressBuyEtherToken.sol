pragma solidity >=0.7.0 <0.9.0;

contract myAddress {
    
// mapping is a key / value pair
    mapping(address => uint256 ) public balance;
    address payable mywallet1;
    
    event Purchase (
        address _buyer,
        uint256 _amount
    );

    //event are for subscribing and filtering for an event.
    constructor (address payable _wallet) {
        mywallet1 = _wallet;
    }
    
    fallback() external payable {
        buyAsset();
    }
    
    function buyAsset() public payable{
        //buy 
        
        balance[msg.sender] += 1;
        mywallet1.transfer(msg.value);
        //send ether to a wallet
        emit Purchase(msg.sender, 1);
    }
}