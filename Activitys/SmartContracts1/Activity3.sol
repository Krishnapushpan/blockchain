//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Activity3 {
struct emp{    
    string  name;
    string  department;
    string  designation;
    uint16  salary;
    address payable paymentad;

    }
    emp public employee;
    function getEmployee()public view returns(string memory,string memory,string memory ,uint16,address payable ) {
        return (employee.name,employee.department,employee.designation,employee.salary, employee.paymentad);
    }
    function setEmployee(string memory _name,string memory _depart,string memory _design,uint16 _salary,address payable _paymentad) public {
        employee.name=_name;
        employee.department=_depart;
        employee.designation=_design;
        employee.salary=_salary;
        employee.paymentad=_paymentad;
    }
     function ethTowei(uint eval) public pure returns(uint){
        return(eval*1000000000000000000);
     }

       
           function payemp() public payable {
            uint sal =ethTowei(employee.salary);
                        require(msg.value >= sal, "Insufficient payment amount");
                        require(employee.paymentad != address(0), "Employee wallet not set");
                        employee.paymentad.transfer(sal);
            }
       
}