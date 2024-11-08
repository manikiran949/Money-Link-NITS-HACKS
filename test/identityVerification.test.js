const IdentityVerification = artifacts.require("IdentityVerification");

contract('IdentityVerification', (accounts) => {
  let contract;

  before(async () => {
    contract = await IdentityVerification.deployed();
  });

  it('should store Aadhaar hash', async () => {
    const aadhaarHash = web3.utils.sha3("1234-5678-9101-1121"); // Example Aadhaar hash
    await contract.storeAadhaarHash(aadhaarHash, { from: accounts[0] });

    const storedHash = await contract.aadhaarHash(accounts[0]);
    assert.equal(storedHash, aadhaarHash, 'Aadhaar hash does not match');
  });

  it('should verify KYC', async () => {
    await contract.verifyKYC({ from: accounts[0] });
    const kycStatus = await contract.getKYCStatus(accounts[0]);
    assert.isTrue(kycStatus, 'KYC status should be true');
  });
});
