//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Bank{
    address public  accHolder;
    uint256 balance = 0;

    constructor(){
        accHolder = msg.sender ;
    }

    function withdraw () payable  public {
        require(msg.sender == accHolder,"you are not the account owner ");
        require(balance > 0 ,"you don't have enough balance .");
        payable(msg.sender).transfer(balance);
        balance = 0;
}

        function deposit() public payable  {
            require(msg.value > 0 ,"deposit amount should be greater than 0.");
            require(msg.sender == accHolder,"you are not the account owner ");
            balance += msg.value; 

    }

        function showbalance() public view returns(uint) {
            require(msg.sender == accHolder,"you are not the account owner ");
            return balance;

    }
}