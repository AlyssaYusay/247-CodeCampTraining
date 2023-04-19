// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleVoting {

    struct Candidate{
        string name;
        uint voteCount;
    }

    mapping (uint => Candidate) candidates;

    Candidate[] runners;

    function addCandidate(string memory _name) public {
        runners.push(Candidate(_name, 0));
    }

    function voteTo(uint _id) external {
        runners[_id].voteCount++;
    }

    function retrieveVotes(uint _id) external view returns (string memory, uint){
        return (runners[_id].name, runners[_id].voteCount);
    }

}
