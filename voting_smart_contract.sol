pragma solidity ^0.4.25;

contract MyWorldVoting {

    address chieftainHeadAddress;

    struct Candidate{
        address candidateAddress;
        uint votes;
    }

    Candidate[] public candidates;

    struct Vote{
        uint votedCandidateIndex;
        bool alreadyVoted;
    }

    Vote[] public votes;
    mapping (address => Vote) public voterAddressToTheirVote;

    constructor (address _chieftainHeadAddress) public {
        chieftainHeadAddress = _chieftainHeadAddress;
    }
    
    function nominateCandidateAddress (address _candidateAddress) public {
        Candidate memory newCandidate = Candidate ({
            candidateAddress: _candidateAddress,
            votes: 0
        });
        candidates.push(newCandidate);
    }

    function getVotes (uint _candidateIndex) public{
        Vote memory newVote = Vote ({
            votedCandidateIndex: _candidateIndex,
            alreadyVoted: true
        });
        voterAddressToTheirVote[msg.sender] = newVote;
        candidates[_candidateIndex].votes++;
    }

    function getVoteResults (uint _candidateIndex) public view returns (uint) {
        return candidates[_candidateIndex].votes;
    }
}
