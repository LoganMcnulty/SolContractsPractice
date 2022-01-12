pragma solidity >=0.7.0 <0.9.0;

contract MyMappingContract {
    
    uint256 public usrCounter = 0;
    //mapping, key value pair unit  is key person is value
    mapping(uint => User) public users;
    
    address public owner = 0x5C92a17184d1Cc192d98891500724fddB762eFEF;
    address public admin;
    uint256 openingTime = 1571057400 ;
    
    modifier onlyWhileOpen() {
        require (block.timestamp >= openingTime);
        _;
    }

    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }
    
    modifier onlyadminUser() {
        require (msg.sender == admin);
        _;
    }
    constructor() {
        admin = msg.sender;
    }
    
    struct User {
        uint _id1;
        string _fname;
        string _lname;
    }
    
    function addUser(string memory _fname, string memory _lname) public onlyadminUser {
    //adding internal function
        addUserCnt();
        users[usrCounter] = User(usrCounter, _fname, _lname);
    }
    
    function addUserCnt() internal {
        usrCounter += 1;
    }
    
}