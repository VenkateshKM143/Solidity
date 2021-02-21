pragma solidity ^0.8.0;

contract Calculator{
    int public result=0;
    
    //addition
    function add(int i,int j) public{
       result=i+j;
    }
    
    //substraction
    function sub(int i,int j) public{
        result=i-j;
    }
    
    //multiplication
     function mul(int i,int j) public{
        result=i*j;
    }
    
    //division
    function div(int i,int j) public{
        result=i/j;
    }
    function getDivresult() public view returns(int  res,int8 dec){
        return(result,-2);
    }
}
