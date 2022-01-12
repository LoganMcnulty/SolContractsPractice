pragma solidity >=0.7.0 <0.9.0;

contract holdData {
    uint public data = 500;
    //hd.myBaseData(20);
    
    function setMyData (uint256 _i) public pure returns (uint256 _prd) {
        _prd = _i * 2;
    }

    function myBaseData(int256 _m) internal pure returns (int256 _r){
        _r = _m + 10;
    }
}

contract basicData {
    uint256 public keyData = 100;
    uint256 public newValue;
    function setVal(uint256 _iVal) public {
        newValue = _iVal;
    }
}

// This is an example of inheritance
contract userBase is basicData {
    // This is an example of instantiation
    holdData hd = new holdData();
    uint256 public theData;
    
    function lookAtData() public view returns (uint256 _k) {
        return hd.data();
    }
    
    function getMyData(uint256 _iData, uint256 _imyData) public  returns (uint256 _dataval, uint256 _key){
        _dataval = hd.setMyData(_iData);
        setVal(_imyData); 
        theData = _dataval;   
        return (theData, keyData); 
    }
}