// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract TokenBalanceTracker {
    mapping (address => uint) tokenBalance;

    function updateBalance(address _owner, uint _amount) external {
        tokenBalance[_owner] += _amount;
    }

    function retrieveBalance(address _owner) external view returns (uint) {
        return tokenBalance[_owner];
    }

    function transfer(address _sender, address _receiver, uint _amount) external payable {
        require(tokenBalance[_sender] >= _amount, "Insuffecient balance");
        tokenBalance[_sender] -= _amount;
        tokenBalance[_receiver] += _amount;
    }
}