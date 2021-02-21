pragma solidity ^0.8.0;

contract Arrays{

    // Static Array
    // state variables
    uint[4] public user_id;

    function setUser(uint _user, uint _index) public{

        user_id[_index] = _user;

    }

    function getUser(uint _index) public view returns(uint){

        return user_id[_index];

    }

    function updateUser(uint _user, uint _index) public{

        user_id[_index] = _user;

    }

    function delUser(uint _index) public {

        delete user_id[_index];

    }

    function lenArray() public view returns(uint){
        return user_id.length;
    }


    // Dynamic Array

    // state Variable
    uint[] public dUser;

    function setUserd(uint _user) public{

        dUser.push(_user);

    }

    function getUserd(uint _index) public view returns(uint){

        return dUser[_index];

    }

    function updateUserd(uint _user, uint _index) public{

        dUser[_index] = _user;

    }

    function delUserd(uint _index) public {

        delete dUser[_index];

    }

    function delLast() public{

        dUser.pop();

    }

    function lenArrayd() public view returns(uint){
        return dUser.length;
    }

}
