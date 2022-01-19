// SPDX-License-Identifier: MIT
pragma solidity >0.4.0 <=0.7.0;
pragma experimental ABIEncoderV2;

contract voting{
    // DECLARATIONS -----------------------------------------    
    address public owner;

    //constructor
    constructor () public{
        owner = msg.sender;
    }

    // map names and hashes
    mapping(string => bytes32) idCandidate;

    // map candidates and votes counter
    mapping(string => uint) candidateVotes;

    // candidates list
    string[] candidates;

    // voters' hashes list
    bytes32[] voters;


    // CANDIDATES -------------------------------------------
    function NewCandidate(string memory _name, uint _age, string memory _candidateId) public{
        // candidates' data hash
        bytes32 candidatesHash = keccak256(abi.encodePacked(_name, _age, _candidateId));

        // store candidates' data
        idCandidate[_name] = candidatesHash;

        // store candidate in list
        candidates.push(_name);
    }

}