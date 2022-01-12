pragma solidity >=0.7.0 <0.9.0;

contract addEm {

    function myAdd(uint256 numVal, uint256 baseVal) public pure returns (uint _a) {
        _a = numVal * baseVal + 69;
        testP("TACO TIME");
    }

    function testP(string memory _mystr) public pure returns(string memory _str){
        _str = _mystr;
    }

    function myView(uint256 numVal, uint256 baseVal) public view returns (uint _a) {
        _a = numVal * baseVal + 10;
    }
    
}