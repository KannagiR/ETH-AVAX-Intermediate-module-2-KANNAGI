// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

//import "hardhat/console.sol";

contract Assessment {
   
    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    

    mapping(address => uint256) public balanceOf;
    mapping(address => address) public ownerOf;                                                                                                                                         
      
    
    function getBalance() public view returns(uint256){
    return balanceOf[msg.sender];
    }

    function depositamount(uint256 _amount) public payable {
        // Get the previous balance of the account
        uint _previousbalance= balanceOf[msg.sender];


        // perform transaction
        balanceOf[msg.sender] += _amount;


        // assert transaction completed successfully
        assert(balanceOf[msg.sender] == _previousbalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdrawamount(uint256 _withdrawAmount) public {
       
        uint _previousBalance = balanceOf[msg.sender];
        if (balanceOf[msg.sender] < _withdrawAmount) {
            revert InsufficientBalance({
                balance: _previousBalance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdrawamount
        balanceOf[msg.sender] -= _withdrawAmount;

        // assert if the balance is correct
        assert(balanceOf[msg.sender] == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }
    
    // Function to check the balance of an account
    function checkBalance() public view returns(uint256) {
    address account = msg.sender;
    return balanceOf[account];
    }
 
}
  
