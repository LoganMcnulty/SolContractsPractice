//Start copy here
pragma solidity <=0.5.2;
contract TransferEtherWhenDone {
    
    //Roles: Payer and payee
    //Deply with 0xE2Bf7Cd3E06e1B02954c5AcA98D01fFcB31065db
    //Change to and run as 0x43082E86EbF47721e1Ce3cd31CDfE90883258420
    //Enter 5 Ether
    //Click buyAsset, should fail
    //Click myCompleted
    //Enter 5 Ether
    //Click buyAsset
    
    //mapping is a key / value pair
    mapping(address => uint256 ) public balance;
    address payable mywallet1;
    address owner = 0xE2Bf7Cd3E06e1B02954c5AcA98D01fFcB31065db;
   
  
    
    //*** Step 1 remove the comments /* */ around modifier
    
    
    modifier onlyOwner() {
                            //leave thes commensts: only the owner can run the function myCompleted()
        require (msg.sender == owner);  
        _;
        
    }
    
    
    //*** Step 2 remove the /* */ around enum and Status
    
    
    enum Status {working, completed}  //leave thes commensts: eum to let the owner set the staus of a job
    Status public myJobStatus;
   
       
    
    function myWorking() public  {
        myJobStatus = Status.working;
    }
    
    
    //*** Step 3 remove the /* */ around myCompleted()
    
    function myCompleted() public onlyOwner  {
        myJobStatus = Status.completed;
    }
    
  
    event Purchase (
        address _buyer,
        uint256 _amount,
        string message
        
    );
    //event are for subscribing and filtering for an event.
    
    constructor (address payable _wallet) public {
        mywallet1 = _wallet;
        myJobStatus = Status.working;
        
    }
    
    function buyAsset() public payable{
        //buy 
        
        balance[msg.sender] += 1;
        
        if (myJobStatus == Status.completed){
        
            mywallet1.transfer(msg.value);
                //send ether to a wallet
            emit Purchase(msg.sender, 1, "");
        
        }else {
            revert();
        }
        
    }
}    
//Stop select copy here
