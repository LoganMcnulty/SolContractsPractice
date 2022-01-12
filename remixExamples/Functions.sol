pragma solidity >=0.7.0 <0.9.0;

contract FuncContract {

    string public value;
    string public myVal;
    uint256 public myInt;
    uint256 public fullInt;

    function set(string memory _value, string memory _MyVal1, uint256 j) public {
        value = _value;
        myVal = _MyVal1;
        setInt(j);
    }

    function setInt(uint256 i) public {
        myInt = i;
        fullInt = myInt + 69;
    }

    function get() public view returns(string memory, string memory, uint256 _fullint){
        return (value, myVal, fullInt);
    }

}
