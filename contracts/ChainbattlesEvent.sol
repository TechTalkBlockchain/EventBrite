// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EventBrite{
    
    // Address of the NFT contract
    IERC721 public nftContract;

    // Struct to store event details
    struct Event {
        string name;
        string description;
        uint256 date;
        address organizer;
        uint256 maxParticipants;
        uint256 participantCount;
        bool isActive;
    }

    
    mapping(uint256 => Event) public events;
    uint256 public eventCount;

    // Mapping to track event participants by eventId and NFT tokenId
    mapping(uint256 => mapping(uint256 => bool)) public eventParticipants;

    // Constructor to set the NFT contract address
    constructor(address _nftContract) {
        nftContract = IERC721(_nftContract);
    }

    // Modifier to check if the sender owns the NFT
    modifier ownsNFT(uint256 _tokenId) {
        require(nftContract.ownerOf(_tokenId) == msg.sender, "You do not own this NFT");
        _;
    }

    // Function to create a new event only Owner can create invite
    function createEvent(string memory _name, string memory _description, uint256 _date, uint256 _maxParticipants) public {
        eventCount++;
        events[eventCount] = Event({
            name: _name,
            description: _description,
            date: _date,
            organizer: msg.sender,
            maxParticipants: _maxParticipants,
            participantCount: 0,
            isActive: true
        });
    }

    // Function to participate in an event using an NFT
    function participateInEvent(uint256 _eventId, uint256 _tokenId) public ownsNFT(_tokenId) {
        Event storage _event = events[_eventId]; 
        (_event.isActive, "Event is not active");
        require(_event.participantCount < _event.maxParticipants, "Event is full");
        require(!eventParticipants[_eventId][_tokenId], "Already registered for this event with this NFT");

        // Mark the tokenId participated
        eventParticipants[_eventId][_tokenId] = true;
        _event.participantCount++;
    }

    // Function to Deactivate the event
    function deactivateEvent(uint256 _eventId) public {
        Event storage _event = events[_eventId];
        require(msg.sender == _event.organizer, "Only the organizer can deactivate the event");
        _event.isActive = false;
    }
}
