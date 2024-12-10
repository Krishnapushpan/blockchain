//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Activity1 {
    uint16 number1;
    uint16 number2;
    uint16 number3;
    uint16 digit;
    int16 sign;
 

       function setNumbers(uint16 num1,uint16 num2,uint16 num3) public
           {
            number1= num1;
            number2= num2;
            number3= num3;
            }
        function Largestnum() public view returns(uint16){
            uint16 large= number1;
            if(large< number2){
                    large=number2;
                    }
            if(large<number3){  
                    large=number3;
                    }
            return large;
        }
        function setDigit(uint16 num)public{
            digit=num;
        }
        function checkdigit() public view returns(string memory){
   
            if (digit==0)return "zero";
            if (digit==1) return "one";
            if(digit==2) return "two";
            if(digit==3) return "three";
            if(digit==4) return "four";
            if(digit==5) return "five";
            if(digit==6)  return "six";
            if(digit==7)  return "seven";
            if(digit==8)  return "eight";
            if(digit==9)  return "nine";
           return "invalid input";
            }
        function setnumber(int16 number)public{
            sign=number;
        }    
        function signchecking()public view returns(string memory){
            if(sign==0)
           {
             return "zero";
           }
            else if(sign>0)
           {
             return "positive";
           }
            else if(sign<0)
            {
                return "negative";
            }
             return "invalid input";
        }
        }

     