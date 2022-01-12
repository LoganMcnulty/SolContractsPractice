pragma solidity >=0.7.0 <0.9.0;

contract EvaluateStringsContract {
    bool public bEqual;
    string public mystring1;
    string public mystring2;
    
    function stringComp(string memory _str2, string memory _str3) public returns(string memory _str0, string memory _str1) {
       bEqual = compareStringsbyBytes(_str2, _str3);
        if (bEqual == false){
            _str0 = _str2;
            _str1 = _str3;
            mystring1 = _str0;
            mystring2 = _str1;
            return (mystring1, mystring2);
        }
        else{
            mystring1 = "you";
            mystring2 = "fail";
            return (mystring1, mystring2);
        }
    }
    
    function compareStringsbyBytes(string memory s1, string memory s2) internal pure returns(bool){
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }
    
}