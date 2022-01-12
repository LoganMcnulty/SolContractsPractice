pragma solidity >=0.7.0 <0.9.0;

contract ReturnValues{
    uint counter;

    function setNumber() public{
        counter = block.number;
    }

    function getBlockNumber() public view returns (uint) {
        return counter;
    }

    function getBlockNumberAlt() public view returns (uint result) {
        result = counter;
    }
}