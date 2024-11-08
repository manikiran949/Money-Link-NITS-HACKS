// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityLending {
    address public lender;
    address public borrower;
    uint256 public loanAmount;
    uint256 public repaymentAmount;
    uint256 public interestRate;
    uint256 public loanTerm;
    uint256 public repaymentDueDate;

    event LoanFunded(address lender, uint256 amount);
    event LoanRepaid(address borrower, uint256 amount);

    constructor(address _borrower, uint256 _loanAmount, uint256 _interestRate, uint256 _loanTerm) {
        lender = msg.sender;
        borrower = _borrower;
        loanAmount = _loanAmount;
        interestRate = _interestRate;
        loanTerm = _loanTerm;
        repaymentAmount = loanAmount + (loanAmount * interestRate) / 100;
        repaymentDueDate = block.timestamp + loanTerm;
    }

    // Fund the loan
    function fundLoan() external payable {
        require(msg.sender == lender, "Only the lender can fund the loan");
        require(msg.value == loanAmount, "Incorrect loan amount");
        payable(borrower).transfer(loanAmount);
        emit LoanFunded(lender, loanAmount);
    }

    // Repay the loan
    function repayLoan() external payable {
        require(msg.sender == borrower, "Only the borrower can repay the loan");
        require(block.timestamp <= repaymentDueDate, "Loan is overdue");
        require(msg.value == repaymentAmount, "Incorrect repayment amount");

        payable(lender).transfer(msg.value);
        emit LoanRepaid(borrower, repaymentAmount);
    }

    // Check if loan is overdue
    function isLoanOverdue() public view returns (bool) {
        return block.timestamp > repaymentDueDate;
    }
}
