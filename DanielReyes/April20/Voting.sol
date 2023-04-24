// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

    // 1. Create a new file named "Voting.sol" in the Remix IDE.
    // 2. Start by defining the Solidity version and the contract name:

contract Voting {
    // 3. Inside the contract, define an enum `Choices` with two possible values: "Yes" and "No".
    enum Choices {Yes, No}

    // 4. Create a struct `Vote` with two properties: `choice` of type `Choices` and `voter` of type `address`
    struct Vote{
        Choices choice;
        address voter;
    }

    // 5. Declare a public `none` Vote variable with default values (Choices(0) and address(0)).
    Vote public none;

    // 6. Declare a public dynamic array `votes` of the struct `Vote`.
    Vote[] public votes;

    // 7. Implement a function `createVote` that takes a parameter of type `Choices`. This function should ensure that the sender has not voted before and then add a new `Vote` to the `votes` array.
    function createVote(Choices _choice) external {
        require(!hasVoted(msg.sender), "You already voted. Only 1 vote allowed per voter.");
        votes.push(Vote(_choice, msg.sender));
    }

    // 8. Implement a function `changeVote` that takes a parameter of type `Choices`. This function should find the sender's existing vote in the `votes` array, ensure that it exists, and then update the `choice` in the existing vote.
    function changeVote(Choices _choice) external {
        require(hasVoted(msg.sender), "You haven't voted yet.");
        for(uint i=0; i<votes.length; i++){
            if (votes[i].voter == msg.sender){
                votes[i].choice = _choice;
            }
        }
    }

    // 9. Implement an internal view function `findVote` that takes an `address` as a parameter and returns a storage reference to a `Vote`. This function should loop through the `votes` array to find a vote with a matching voter address. If it doesn't find a matching vote, it should return the `none` vote.
    function findVote(address _voter) internal view returns (Vote memory){
        for(uint i=0; i<votes.length; i++){
            if (votes[i].voter == _voter){
                return votes[i];
            }
        }
        return none;
    }

    // 10. Implement a public view function `hasVoted` that takes an `address` as a parameter and returns a boolean indicating whether the address has voted or not. This function should use the `findVote` function to determine the result.
    function hasVoted(address _voter) public view returns (bool){
        for(uint i=0; i<votes.length; i++){
            if (votes[i].voter == _voter){
                return true;
            }
        }
        return false;
    }

    // 11. Implement an external view function `findChoice` that takes an `address` as a parameter and returns the `Choices` value for that address. This function should use the `findVote` function to retrieve the vote.
    function findChoice(address _voter) external view returns (Choices){
        require(hasVoted(_voter), "You haven't voted yet");
        return findVote(_voter).choice;
    }

}