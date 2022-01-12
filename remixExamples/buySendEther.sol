pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    address public token;
    address payable wallet;

// logs the buyer and token amount
// Indexed subscribed to filter events by indexed values
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);

    // allow us to know any time token is purchased in smart contract
        emit Purchase(msg.sender, 1);
    }
}

contract ERC20Token {
    string name;
    mapping(address => uint256) public balances;

    function mint() public {
    // If we were to use this line, it would not work because msg.sender is now referencing "MyContract"
        // balances[msg.sender] += 1;

    // Should use this instead
        balances[tx.origin] += 1;
    }
}