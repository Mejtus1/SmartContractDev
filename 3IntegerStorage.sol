// IntegerStorage 
// Reading and writing to a smart contract with help of RemixIDE 

pragma solidity ^0.8.0;

contract IntegerStorage{

    int public storageValue; 

    function setValue(int _newValue) public{
        storageValue = _newValue; 
    }

    function getValue() public view returns(int){
        return storageValue;
    }
}