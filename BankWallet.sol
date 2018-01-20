pragma solidity ^0.4.18;

import "./IBankWallet.sol";

contract BankWallet is IBankWallet {

     function BankWallet() public {
         owner = msg.sender; // Owner of the contract
     }

     function Deposit(uint256 _amount) public {
         require(_amount >= 0);
         balances[msg.sender] = balances[msg.sender] + _amount;
     }
     
     function Withdraw(uint256 _amount) public returns (uint256){
         
         require(balances[msg.sender] >= _amount);
         
         //if(balances[msg.sender] >= _amount){
         //   balances[msg.sender] = balances[msg.sender] - _amount;
         //}
         
         balances[msg.sender] = balances[msg.sender] - _amount;
         
         return balances[msg.sender];
     }
    
    function GetBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
    
    function Transfer(address _to, uint256 _amount) public returns (uint256) {
    
        require(_amount > 0);
        require(balances[msg.sender] >= _amount);
    
        balances[msg.sender] = balances[msg.sender] - _amount;
        balances[_to] = balances[_to] + _amount;
        
        return balances[msg.sender];
    }
    
}
