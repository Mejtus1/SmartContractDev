// Events in Smart Contracts 

// In Solidity, events are built-in feature used to log important information to blockchain. 
// These events can be listened to and triggered by web3.js (JavaScript) or other frameworks like ethers.js when interacting with smart contract on front-end.

// While events are defined in Solidity, you need external tool like web3.js or ethers.js to capture and respond to these events on front end. 

//Solidity example 
pragma solidity ^0.8.0;

contract MyContract {
    event MyEvent(address indexed from, uint256 value);

    function triggerEvent(uint256 _value) public {
        emit MyEvent(msg.sender, _value);
    }
}

// Web3 interface 
// Assuming you have initialized web3.js and have the contract instance
const contract = new web3.eth.Contract(abi, contractAddress);

// Listening to the event
contract.events.MyEvent({
    fromBlock: 'latest' // You can also specify from a certain block
})
.on('data', (event) => {
    console.log('Event Data:', event);
    // You can trigger other actions based on the event data
})
.on('error', (error) => {
    console.error(error);
});

// On front-end, web3.js is used to listen for emitted event and react to it. 
// Key here is that you need to use web3.js (or another similar library like ethers.js) to listen to blockchain events.

//---------------------------------------------------------------------------------------------------------------//

// Common use cases for event handling in solidity

// 1. Logging Transactions or State Changes
// Logging token transfers, account balance updates, or contract state changes.

event Transfer(address indexed from, address indexed to, uint256 value);

function transfer(address to, uint256 amount) public {
    // Transfer logic
    emit Transfer(msg.sender, to, amount);
}

// 2. Event-Driven User Interfaces
// Front-end applications use events to react to changes in blockchain. 
// For instance, when user interacts with blockchain (e.g., making a transaction), front-end can listen to relevant event and update UI accordingly (e.g., showing success/failure notifications or updating balances).
// A dApp (decentralized app) listens to events like token transfer or user making purchase, so it can update UI in real-time.
// (javascript web3): 
contract.events.Transfer({
    fromBlock: 'latest'
}).on('data', (event) => {
    console.log('Transfer event:', event.returnValues);
    // Update the UI with the new balance
});

// 3. Monitoring for Specific Events
// Smart contracts might emit events to notify other contracts or external systems about certain conditions or changes.
event ContractPaused(bool paused);

function pauseContract() public onlyOwner {
    paused = true;
    emit ContractPaused(paused);
}

function resumeContract() public onlyOwner {
    paused = false;
    emit ContractPaused(paused);
}

