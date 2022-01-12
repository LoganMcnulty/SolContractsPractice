pragma solidity >=0.7.0 <0.9.0;

contract myStructContract {
    
    uint256 public studentCounter = 0;
    
    //a mapping, supports key value pair of each Student to an integer. Which we call ID.
    mapping(uint => Student) public students;  //This is a data management process.
   
   //Define the Student struct 
    struct  Student{
        uint _id1; //each student id
        string _fname; //each Student first name
        string _lname; //each Student last name
        string _petName;
    }
    
    function addStudent(string memory _fname, string memory _lname, string memory _petName) public {
        studentCounter++;
        students[studentCounter] = Student(studentCounter, _fname, _lname, _petName);
    }
    
}