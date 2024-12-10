//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Activity2 {
      uint16 LeapYear;
    
    function setYear(uint16 Year)public {
        LeapYear=Year;
    }
    function Leapyear()public view returns (string memory,uint16,string memory){
        uint16 count;
        uint16 tempyear=LeapYear;
        // uint16 temp2year=year;
        while(tempyear>0){
            count++;
            tempyear=tempyear/10;
        }

    if(count==4){
                if(LeapYear%4==0 && LeapYear%100!=0)
                    {
                            return ("it contain 4 digit",count,"it is a leap year");
                    }
                else{
                            return ("it contain 4 digit",count,"it is not a  leap year");
                    }
    }
     else {
            return ("It does not contain 4 digits", count,"it is not a year");
        }
    }
}