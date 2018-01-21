pragma solidity ^0.4.18;

import "./IBankWallet.sol";
import "./SafeMath.sol";
import "./Ownable.sol";

contract BankWallet is IBankWallet, Ownable {

     using SafeMath for uint256;
     
     function BankWallet() public {
         owner = msg.sender; // Owner of the contract
         // msg.value
         totalAmount = 0;
     }

     function Deposit(uint256 _amount) public {
         require(_amount >= 0);
         //balances[msg.sender] = balances[msg.sender] + _amount;
         balances[msg.sender] = balances[msg.sender].add(_amount);
         totalAmount = totalAmount.add(_amount);
     }
     
     function Withdraw(uint256 _amount) public returns (uint256){
         
         require(balances[msg.sender] >= _amount);
         
         //if(balances[msg.sender] >= _amount){
         //   balances[msg.sender] = balances[msg.sender] - _amount;
         //}
         
         //balances[msg.sender] = balances[msg.sender] - _amount;
         balances[msg.sender] = balances[msg.sender].sub(_amount);
         totalAmount = totalAmount.sub(_amount);
         
         return balances[msg.sender];
     }
    
    function GetBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
    
    // Should not be executed by everyone - can be executed by only owner
    function GetBankBalance() public view onlyOwner returns (uint256){
        return totalAmount;
    }
    
    function Transfer(address _to, uint256 _amount) public returns (uint256) {
    
        require(_amount > 0);
        require(balances[msg.sender] >= _amount);
    
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        
        return balances[msg.sender];
    }
    
}
