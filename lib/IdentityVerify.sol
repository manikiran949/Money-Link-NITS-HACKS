// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract IdentityVerification {
    using ECDSA for bytes32;

    struct User {
        string name;
        bytes32 aadhaarHash;
        bool isVerified;
    }

    mapping(address => User) private users;
    address public admin;

    event UserRegistered(address indexed userAddress, string name, bytes32 aadhaarHash);
    event UserVerified(address indexed userAddress);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function registerUser(string memory name, string memory aadhaar) public {
        bytes32 aadhaarHash = keccak256(abi.encodePacked(aadhaar));
        users[msg.sender] = User(name, aadhaarHash, false);
        emit UserRegistered(msg.sender, name, aadhaarHash);
    }

    function verifyUser(address userAddress) public onlyAdmin {
        users[userAddress].isVerified = true;
        emit UserVerified(userAddress);
    }

    function getUser(address userAddress) public view returns (string memory, bytes32, bool) {
        User memory user = users[userAddress];
        return (user.name, user.aadhaarHash, user.isVerified);
    }
}