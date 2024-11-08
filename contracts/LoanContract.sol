// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoanContract {
    address public lender;
    address public borrower;
    uint256 public loanAmount;
    uint256 public repaymentAmount;
    uint256 public loanDueDate;
    bool public loanPaid;

    // Event declarations
    event LoanDisbursed(address borrower, uint256 amount);
    event LoanRepayment(address borrower, uint256 amount);
    
    constructor(address _borrower, uint256 _loanAmount, uint256 _repaymentAmount, uint256 _loanDueDate) {
        lender = msg.sender;
        borrower = _borrower;
        loanAmount = _loanAmount;
        repaymentAmount = _repaymentAmount;
        loanDueDate = _loanDueDate;
        loanPaid = false;
    }

    // Disburse loan to borrower
    function disburseLoan() external payable {
        require(msg.sender == lender, "Only lender can disburse the loan");
        require(msg.value == loanAmount, "Incorrect loan amount sent");
        payable(borrower).transfer(loanAmount);
        emit LoanDisbursed(borrower, loanAmount);
    }

    // Repay loan
    function repayLoan() external payable {
        require(msg.sender == borrower, "Only borrower can repay");
        require(!loanPaid, "Loan is already repaid");
        require(msg.value == repaymentAmount, "Incorrect repayment amount");

        // Mark the loan as repaid
        loanPaid = true;
        payable(lender).transfer(repaymentAmount);
        emit LoanRepayment(borrower, repaymentAmount);
    }
}
