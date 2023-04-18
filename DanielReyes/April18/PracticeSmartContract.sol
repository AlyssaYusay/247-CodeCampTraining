// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract PracticeSmartContract {
    address public user;

    // Creating a struct for mapping
    struct Token{
        address owner;
        uint totalSupply;
        string name;
        string symbol;
    }

    // Map the token to read
    mapping (address => Token) public tokens;

    constructor(uint _totalSupply, string memory _name, string memory _symbol) {
        tokens[msg.sender] = (Token(
            {
                owner : msg.sender,
                totalSupply : _totalSupply,
                name : _name,
                symbol : _symbol
            }
        ));
        
    }

    // Transfer function
    function transfer(address _sender, address _receiver, uint _amount) public payable{
        if(_amount <= tokens[_sender].totalSupply) {
            tokens[_sender].totalSupply -= _amount;
            tokens[_receiver].owner = _receiver;
            tokens[_receiver].totalSupply += _amount;
            tokens[_receiver].name = tokens[_sender].name;
            tokens[_receiver].symbol = tokens[_sender].symbol;
        } 
    }

    // getter function
    function getInformation(address _owner) public view returns (Token memory){
        return tokens[_owner];
    }
}