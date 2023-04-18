// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract tokenContract {
    
    mapping(address => uint) public tokenBalance;
    
    uint public totalSupply;
    string public tokenName;
    string public symbol;
    // address sender = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // address recipient1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    // address recipient2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    

    
    constructor(uint256 _totalSupply){
        tokenName = "Token";
        symbol = "TKN";
        totalSupply = _totalSupply;
        tokenBalance[msg.sender] = _totalSupply;
        console.log(address(this));

    }

    modifier checkBalance(address _sender, uint _value) {
        require (tokenBalance[_sender] >= _value, "Insufficient Balance!");
        _;
    }

    modifier checkUser(address _sender){
        require( _sender != msg.sender, "You are sending to yourself!");
        _;
    }
    
    function transfer(address _recipient, uint _value) public checkBalance (msg.sender, _value) checkUser (_recipient) {
        tokenBalance[msg.sender] -= _value;
        tokenBalance[_recipient] += _value;
    }


}