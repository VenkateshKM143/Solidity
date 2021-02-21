pragma solidity ^0.8.0;

contract dBank{
    
    // state variables
    
    address owner;
    
    uint public flag;
    
    
    event Registered(string _name, uint _balance, address _adrs, uint _trxCounter);
    event Deposited(address _adrs, uint _upBalance, uint _amt);
    
    struct User{
        
        string name;
        uint balance;
        address adrs;
        uint trxCounter;
        
    }
    mapping( address => User ) users;
    
    mapping(address => bool) kyc;
    
    mapping(address=>bool) hold;
    
   
    // Modifier
    modifier KycTrue(){
        
        require(kyc[msg.sender], "KYC not completed yet.");
        _;
        
    }
    
    //ModifierHold
   // modifier hold(){
   //     require(users[msg.sender],"Account is on hold");
   // }
    
    // Constructor
    constructor () public {
        owner = msg.sender;
        require(users[msg.sender].adrs == address(0), "Account already exists");
        User memory user = User("Owner", 0, msg.sender, 0);
        users[msg.sender] = user;
        kyc[msg.sender] = true;
    }
    
    //modifier2
    modifier AccExists(){
        require(kyc[msg.sender],"Account already Exists.");
        _;
    }
    
    // Functional Declaration
    
    function register(string memory _name) public payable{
        
        require(users[msg.sender].adrs == address(0), "Account already exists");
        require(msg.value >= 2 ether, "You need to deposit atleast 2 ether to open account.");
        User memory user = User(_name, msg.value, msg.sender, 1);
        users[msg.sender] = user;
        emit Registered(_name, msg.value, msg.sender, 1);
        
    }
    
    function getKycStatus() public view returns(bool){
        return kyc[msg.sender];
    }
    
    function completeKyc(address _adrs) public {
        
        require( msg.sender == owner, "You are not the Owner." );
        require( kyc[_adrs] == false, "KYC already completed." );
        kyc[_adrs] = true;

        
    
    }
    
    function deposit() public KycTrue payable{
        
        users[msg.sender].balance += msg.value;
        users[msg.sender].trxCounter += 1;
        emit Deposited(msg.sender, users[msg.sender].balance, msg.value);
        
    }
    
   /* function  hold_account() public view returns(bool){
         return hold[msg.sender];
    }
       */

    
    function withdraw(uint _amt) public KycTrue {
        
        require( users[msg.sender].balance >= _amt , "Low Balance" );
        users[msg.sender].balance -= _amt;
        users[msg.sender].trxCounter += 1;
        payable(msg.sender).transfer(_amt);
        
    }
    
    function transferTo(address payable _to, uint _amt) public KycTrue {
        
        require( users[msg.sender].balance >= _amt , "Low Balance" );
        users[msg.sender].balance -= _amt;
        users[msg.sender].trxCounter += 1;
        _to.transfer(_amt);
        
    }
    
    function closeAccount() public{
        
        require(msg.sender != owner, "Owner cannot close account.");
        uint balance = users[msg.sender].balance;
        delete users[msg.sender];
        kyc[msg.sender] = false;
        payable(msg.sender).transfer(balance);
        
    }
    
    function checkBalance() public view returns(uint) {
        
        return users[msg.sender].balance;
        
    }
    
    function getDBankBalance() public view returns(uint) {
        
        require(msg.sender == owner, "You are not the owner." );
        return address(this).balance;
    }
    
    receive () external payable {
        if(msg.value>0){
            deposit();
        }else{
            flag++;
        }
    }
    
}
