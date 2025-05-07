// Proxy Contract 

// - you cannot change logic of deployed contract
// - if you find bug or want to add features, you’d normally have to deploy new contract
// - creates problems for long-term apps or DeFi platforms where users rely on same contract address

// Codes for Proxy Contract
// MyContract.sol

contract MyContract{

uint256 private value;

function setValue(uint256 _value) public{
    value = _value;
}

function get() public view returns (uint256){
    return value;
    }
}

// MyContactV2.sol
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9 ;

contract MyContractV2{
    uint256 private value;

function setValue(uint256 _value) public{
    value = _value;
}

function get() public view returns (uint256){
    return value;
}

function incrementValue() public {
    value = value + 1 ;
    }
}