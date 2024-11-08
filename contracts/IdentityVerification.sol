// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityVerification {

    // Mapping of user address to Aadhaar hash
    mapping(address => bytes32) public aadhaarHash;

    // Mapping of user address to KYC verification status
    mapping(address => bool) public isKYCVerified;

    // Event to notify Aadhaar hash stored
    event AadhaarVerified(address indexed user, bytes32 aadhaarHash);

    // Event to notify KYC status
    event KYCStatusChanged(address indexed user, bool status);

    // Store Aadhaar hash for a user
    function storeAadhaarHash(bytes32 _aadhaarHash) public {
        aadhaarHash[msg.sender] = _aadhaarHash;
        emit AadhaarVerified(msg.sender, _aadhaarHash);
    }

    // Verify KYC
    function verifyKYC() public {
        // In real-world, you'd connect with some KYC API
        // For now, we'll set it manually
        isKYCVerified[msg.sender] = true;
        emit KYCStatusChanged(msg.sender, true);
    }

    // Get user's KYC status
    function getKYCStatus(address _user) public view returns (bool) {
        return isKYCVerified[_user];
    }
}
