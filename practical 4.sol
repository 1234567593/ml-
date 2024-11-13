// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Structure to store student details
    struct Student {
        uint id;
        string name;
        uint age;
        string course;
    }
    
    // Array to store list of students
    Student[] private students;
    uint public studentCount = 0;
    
    // Mapping to check if student ID is already registered
    mapping(uint => bool) public studentExists;
    
    // Event to log addition of a student
    event StudentAdded(uint id, string name, uint age, string course);

    // Function to add a new student
    function addStudent(uint _id, string memory _name, uint _age, string memory _course) public {
        // Ensure the student ID is unique
        require(!studentExists[_id], "Student ID already exists");
        
        // Add the student to the array
        students.push(Student(_id, _name, _age, _course));
        studentExists[_id] = true;
        studentCount++;

        emit StudentAdded(_id, _name, _age, _course);
    }
    
    // Function to retrieve a student's data by index
    function getStudent(uint index) public view returns (uint, string memory, uint, string memory) {
        require(index < students.length, "Invalid index");
        Student memory student = students[index];
        return (student.id, student.name, student.age, student.course);
    }

    // Receive function to handle direct Ether transfers
    receive() external payable {
        // Logic if any Ether is sent to the contract directly
    }

    // Fallback function to handle non-matching function calls or Ether with data
    fallback() external payable {
        // Logic if Ether is sent with data or invalid function calls
    }

    // Function to check contract balance (for testing purposes)
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
