// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleStorage {
    mapping ( address => mapping (string => string)) storages;

    function store(string memory _key, string memory _value) external {
        storages[msg.sender][_key] = _value;
    }

    function retrieve(string memory _key) external view returns (string memory){
        return storages[msg.sender][_key];
    }

    function deleteKey(string memory _key) external {
        storages[msg.sender][_key] = "";
    }
}