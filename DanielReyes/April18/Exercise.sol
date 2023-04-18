// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint public x;

    // Task 1
    // constructor(uint _x){
    //     x = _x;
    // }

    // Task 2
    function inc() public{
        x += 1;
    }
    
    // Task 3 v1: Implicit Return
    function add(uint params) external view returns (uint sum){
        sum = params + x;
    }

    // Task 3 v2: Regular Return Expression
    // function add(uint params) external view returns (uint){
    //     return params + x;
    // }

    // Task 4 v1: Implicit Return
    // function double(uint _param) external pure returns (uint d){
    //     d = _param * 2;
    // }

    // Task 4 v2: Regular Return Expression
    function double(uint _param) external pure returns (uint){
        return _param * 2;
    }

    // Task 5:
    // function double(uint _a, uint _b) external pure{

    // }

    // }// Task 6 v1: Implicit Return
    // function double(uint _a, uint _b) external pure returns (uint a, uint b){
    //     a = _a * 2;
    //     b = _b * 2;
    // }

    // Task 6 v2: Regular Return Expression
    function double(uint _a, uint _b) external pure returns (uint, uint){
        return (_a * 2, _b * 2);
    }

}