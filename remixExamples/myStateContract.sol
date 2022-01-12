// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract myStateContract {

    enum UserOptions {listen, connect, cancel}
    
    UserOptions public myOption;
    
    constructor() {
        myOption = UserOptions.connect;
    }
    
    function connect() public {
        myOption = UserOptions.connect;
    }

    function listen() public {
        myOption = UserOptions.listen;
    }

    function cancelYO() public {
        myOption = UserOptions.cancel;
    }
    
    function testCancel() public view returns(bool){
        return myOption == UserOptions.cancel;
    }
    
    function getMyEnum() public view returns (UserOptions _opts){
        return myOption;
    }
    
}