// SPDX-Licence-Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VoltingSystem {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping (address => bool) public voters;

    Candidate[] public candidates;

    constructor (string[] memory candidateNames){
        for (uint256 i = 0; i < candidateNames.length; i++){
                candidates.push(Candidate({
                    name: candidateNames[i],
                    voteCount: 0
                })
            );
        }
    }

    function castVote(uint256 candidateIndex) public {
        require(candidateIndex < candidates.length, "Invalid candidate index");
        require(!voters[msg.sender], "You have already voted");

        voters[msg.sender] = true;
        candidates[candidateIndex].voteCount++;

        emit Voted(msg.sender, candidates[candidateIndex].name, candidates[candidateIndex].voteCount);
    }

    function getWinner() public view returns (string memory winnerName, uint256 winningVoteCount){
        uint256 maxVotes = 0;
        uint256 winningCandidateIndex = 0;
        for (uint256 i = 0; i < candidates.length; i++){
            if(candidates[i].voteCount > maxVotes){
                maxVotes = candidates[i].voteCount;
                winningCandidateIndex = i;
            }
        }
        return (candidates[winningCandidateIndex].name, maxVotes);
    }

    event Voted(address indexed voter, string candidateNames, uint256 candidateIndex);
    event WinnerDeclared(string winnerName, uint256 winningVoteCount);
}