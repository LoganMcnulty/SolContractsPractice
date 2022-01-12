pragma solidity >=0.7.0 <0.9.0;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor (string memory _name) {
        name = _name;
    }

    function mint() virtual public {
    // If we were to use this line, it would not work because msg.sender is now referencing "MyContract"
        // balances[msg.sender] += 1;

    // Should use this instead
        balances[tx.origin] ++;
    }
}

contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    address payable wallet;

// logs the buyer and token amount
// Indexed subscribed to filter events by indexed values


    // pass in constructor from ERC20Token
    constructor (
        string memory _name, 
        string memory _symbol
    )
    ERC20Token(_name) {
        symbol = _symbol;
    }

    function mint() override public {
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }

}

