// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.1;

contract MyBank {
    mapping(address => uint) private _balances;
    address public owner;
    event LogDepositMade(address accountHolder, uint amount);

    constructor() {
        owner = msg.sender;
        emit LogDepositMade(msg.sender, 1000);
    }

    function deposit() public payable returns (uint) {
        require((_balances[msg.sender] + msg.value) > _balances[msg.sender] && msg.sender != address(0));

        _balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return _balances[msg.sender];
    }

    function withdraw(uint withdrawAmount) public returns (uint) {
        require(_balances[msg.sender] >= withdrawAmount);
        require(msg.sender != address(0));
        require(_balances[msg.sender] > 0);
        _balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount);
        emit LogDepositMade(msg.sender, withdrawAmount);
        return _balances[msg.sender];
    }

    function viewBalance() public view returns (uint) {
        return _balances[msg.sender];
    }
}
