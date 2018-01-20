pragma solidity ^0.4.18;

contract IBankWallet {

     address owner;

     mapping(address => uint256) balances;
     // balances["0xabcdef"] = 100;

    function Deposit(uint256 _amount) public;
    function Withdraw(uint256 _amount) public returns (uint256);
    function GetBalance() public view returns (uint256);
    function Transfer(address _to, uint256 _amount) public returns (uint256);
    
}
