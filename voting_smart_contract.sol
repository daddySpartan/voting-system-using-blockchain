pragma ^0.8.7;

contract MyWorldVoting {

    address chieftainHeadAddress;

    struct Candidate{
        address candidateAddress;
        uint votes;
    }

    struct Vote{
        uint votedCandidateIndex;
        bool alreadyVoted;
    }
