pragma solidity ^0.8.0;

contract myContract{
        bool public flag=true;
        
        function toggle() public{
            
            flag !=flag;
            
        }
        uint public uinteger=0;
        
        function sub(uint i) public{
             unchecked { uinteger=uinteger - i; }
        } 
        function add(uint i) public{
             unchecked { uinteger=uinteger + i; }
        }
}
