// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

//import "hardhat/console.sol";

contract Assessment {
    address payable public owner;
    uint256 public balance;
    // uint public b=5;
    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    


    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function depositamount(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");

        // perform transaction
        balance += _amount;

        // assert transaction completed successfully
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdrawamount(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner.");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdrawamount
        balance -= _withdrawAmount;

        // assert if the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }

    function Ownercheck()public pure returns(string memory){
        string memory name="Kannagi Rajkhowa";
        return name;
    }
    
    
  
