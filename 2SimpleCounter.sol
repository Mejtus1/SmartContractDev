// Simple Counter

// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract SimpleCounter {
    uint256 public counter; 

    event CounterIncrement( uint256 newValue); 

    constructor() {
        counter =0;
    }

    function incrementCounter() public {
        counter++;
        emit CounterIncrement(counter); 
    }
}

