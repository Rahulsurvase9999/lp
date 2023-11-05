Sample Code:
Wallets are just like your bank account, through which we can receive money, send money, and
can check the balance.
Deposit money into the create account:
// pragma is the directive through
// which we write the smart contract
pragma solidity 0.6.0;
// Creating a contract
contract wallet{
 address payable public Owner;
// mapping is created for mapping
// address=>uint for transaction
mapping(address=>uint) Amount;
// Defining a constructor
constructor() public payable{
// msg.sender is the address of the
// person who has currently deployed contract
Owner = msg.sender
 Amount[Owner] = msg.value;
}
 modifier onlyOwner(){
require(Owner == msg.sender);
}
function sendMoney (address payable receiver, uint amount)
public payable onlyOwner
 {
require( receiver.balance>0);
require(amount>0);
Amount[Owner] -= amount;
Amount[receiver] += amount;
}
function ReceiveMoney() public payable{
}
function CheckBalance_contractAccount()
public view onlyOwner returns(uint){
return address(this).balance;
}
function CheckBalance()
public view onlyOwner returns(uint){
return Amount[Owner];
}
}
Withdrawals and Account Balances:

Given the balance Of mapping from account addresses to ether amounts, the remaining code
for a fully-functional bank contract is pretty small. simply add a withdrawal function:
bank.sol
pragma solidity ^0.4.19;
contract Bank {
 mapping(address => uint256) public balanceOf; // balances, indexed by addresses
 function deposit(uint256 amount) public payable {
 require(msg.value == amount);
 balanceOf[msg.sender] += amount; // adjust the account's balance
 }
 function withdraw(uint256 amount) public {
 require(amount <= balanceOf[msg.sender]);
 balanceOf[msg.sender] -= amount;
 msg.sender.transfer(amount);
 }
}
 The require(amount <= balances[msg.sender]) checks to make sure the sender has
sufficient funds to cover the requested withdrawal. If not, then the transaction aborts
without making any state changes or ether transfers.
 The balanceOf mapping must be updated to reflect the lowered residual amount after
the withdrawal.
 The funds must be sent to the sender requesting the withdrawal
