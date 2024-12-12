// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract STUDENTS{
    
      address staffadvisor;
      enum Dept { CS, EC, ME }
   
    struct Student
    {
      string name;
      uint16 sem;
      uint16 CGPA;
      Dept dep;
      uint16 rollno;
      bool exist;
    }

    mapping(uint16 => Student) private studdetail;

     
    constructor() {
        staffadvisor = msg.sender;
    }

    modifier admin(){
        require(msg.sender == staffadvisor,"unauthorized access ");
        _;
    }
    modifier studentCheck(uint16 rollno){
        require(studdetail[rollno].exist,"rollno does not exist");
        _;
    }

    function addstud(string memory _name,uint16 _sem,uint16 _CGPA,Dept _dep,uint16 _rollno) public  admin {
            
            require(!studdetail[_rollno].exist, "Roll number is already exists");
            studdetail[_rollno] = Student(_name,_sem,_CGPA,_dep,_rollno,true);
    }

     function getstud(uint16 _rollno) public view admin returns (string memory name, uint16 sem, uint16 CGPA, Dept dep, uint16 rollno) {
        
        Student memory student = studdetail[_rollno];
        return (student.name, student.sem, student.CGPA, student.dep, student.rollno);
    }

    function editstud(uint16 _sem, uint16 _CGPA,Dept _dep,uint16 _rollno) public admin studentCheck(_rollno){

                Student storage student = studdetail[_rollno];
                student.sem= _sem;
                student.CGPA = _CGPA; 
                student.dep = _dep;
              
    }

    function editstudname(string memory _name,uint16 _rollno) public studentCheck(_rollno){

                Student storage student = studdetail[_rollno];
                student.name= _name;
               
    }




}