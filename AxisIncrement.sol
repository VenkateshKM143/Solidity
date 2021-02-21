pragma solidity ^0.8.0;

contract axis{
    int8 public x;
    int8 public y;
    //increment y
    function y_forword() public{
        y=y+1;
        
    }
    //decrement y
    function y_backword() public{
        y=y-1;
        
    }
    //increment x
    function x_right() public{
        x=x+1;
    }
    //decrement x
    function x_left() public{
        x=x-1;
        
    }
    //Getter function
    function getCorrdinates() public view returns(int8 x,int8 y){
        return(x,y);
    }
   
}
