//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract PaymentContract {
    address public payer;
    address public payee;
    uint public amount; 
}

event PaymentMade(address indexed _payer, address indexed _payee, uint _amount);

constructor(address _payee, uint _amount) {
    payee = _payee;
    amount = _amount;
}
modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can call this function.");
}

function makePayment() public payable {
    require(msg.sender == payer, "Only the payer can make a payment");
    require(msg.value == amount, "Incorrect payment amount.");
    payable(payee).transfer(msg.value);
    emit PaymentMade(payer, payee, amount);
}

