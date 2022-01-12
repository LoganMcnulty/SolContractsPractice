pragma solidity >=0.7.0 <0.9.0;

contract Loop {

    struct Student {
        uint grade;
        string name;
    }

    mapping(address => Student) public studentStructs;

    address [] public studentArray;
    uint256 public loopMath;
    int256 public nmCnt=0;
    string [] public studentNameArray;
    
    event LogStudentGrade(address student, uint studentGrade, string studentName);

    function appendStudentGrade(address student, uint studentGrade, string memory sname) public {
        studentArray.push(student);
        studentStructs[student].grade = studentGrade;
        studentStructs[student].name = sname;
    }

    function getStudentCnt() public view returns(uint count) {
        return studentArray.length;
    }

    function arith(uint a) public returns (uint b, string memory str) {
        str = "taco";
        b = 10;
        for (uint i = 0; i < a; i++)
            b = 2 * b + 69;
        loopMath = b;
    }

    function studentLoop() public {
        
        for (uint i=0; i<studentArray.length; i++) {
            emit LogStudentGrade(studentArray[i], studentStructs[studentArray[i]].grade, studentStructs[studentArray[i]].name);
        }
        
        
    }
    
    function studentName() public  {
       uint256 j;
       string memory nm;
       
       while (j < studentArray.length){
            
            nm = studentStructs[studentArray[j]].name;
            studentNameArray.push(nm);
            j++;
            nmCnt++;
        }
    
   }
    
   
}