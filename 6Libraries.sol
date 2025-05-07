// Libraries 

// contracts that can be reused across multiple contracts
// encapsulate and reuse code in modular way of programming 
// primarly used for functions that operate on memory data
//----------------------------------------------------------------------------//
// STRUCTS 

// simple smart contract for getting and setting the data using struct

pragma solidity ^0.8.0;

contract StudentManagement {
    struct Student {
        uint studentid; 
        string name;
        uint age;
    }
}

mapping(uint => Student) public students; // we will be mapping student data 
uint public studentCount = 0;            

function addStudent(string memory _name, uint _age) public {
    studentCount++;
    students[studentCount] = Student(studentCount, _name, _age);
}

function getStudent(uint _studentId) public view returns (string memory, uint) {
    require(_studentId <= studentCount && _studentId > 0 "Student does not exist");
    Student storage student = students[_studentId];
    return (student.name, student.age)

}

// names will be assigned into the struct starting at [0] = name and age 

//----------------------------------------------------------------------------//
// MODIFIERS 
// - acess control example smart contract 

pragma solidity ^0.8.0;

Contract AccessControlExample {
    address public owner; // address
    uint public data; // data for purpose of setting new value 
}

constructor() {
    owner=msg.sender;
}

// only person who owns this smart contract can call the functions 
modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _;
}

function updateData(uint _newData) public onlyOwner {
    data = _newData;
}
