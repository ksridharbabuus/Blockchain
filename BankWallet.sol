pragma solidity ^0.4.18;

import "./IBankWallet.sol";
import "./SafeMath.sol";

contract BankWallet is IBankWallet {

     using SafeMath for uint256;
     
     function BankWallet() public {
         owner = msg.sender; // Owner of the contract
     }

     function Deposit(uint256 _amount) public {
         require(_amount >= 0);
         //balances[msg.sender] = balances[msg.sender] + _amount;
         balances[msg.sender] = balances[msg.sender].add(_amount);
     }
     
     function Withdraw(uint256 _amount) public returns (uint256){
         
         require(balances[msg.sender] >= _amount);
         
         //if(balances[msg.sender] >= _amount){
         //   balances[msg.sender] = balances[msg.sender] - _amount;
         //}
         
         //balances[msg.sender] = balances[msg.sender] - _amount;
         balances[msg.sender] = balances[msg.sender].sub(_amount);
         
         return balances[msg.sender];
     }
    
    function GetBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
    
    function Transfer(address _to, uint256 _amount) public returns (uint256) {
    
        require(_amount > 0);
        require(balances[msg.sender] >= _amount);
    
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        
        return balances[msg.sender];
    }
    
}
