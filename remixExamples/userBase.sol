pragma solidity >=0.7.0 <0.9.0;

contract userBase {

    holdData hd = new holdData();
    uint256 public theData;
    int256 public theFakeData;

    function lookAtData() public view returns (uint256 _k) {
        return hd.data();
    }

    function getMyData(uint256 _iData, int256 _iFakeData) public returns (uint256 _dataval){
        _dataval = hd.setMyData(_iData);
        int256 _fakeData = hd.myBaseData(_iFakeData);
        theData = _dataval;
        theFakeData = _fakeData;
        return theData;
    }
}

contract holdData {
    uint public data = 42;

    function setMyData (uint256 _i) public pure returns (uint256 _prd){
        _prd = _i*2;
    }

    // function myBaseData(int256 _m) internal pure returns (int256 _r){
    function myBaseData(int256 _m) public pure returns (int256 _r){
        _r = _m+10;
    }
}