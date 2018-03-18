pragma solidity 0.4.19;

/* Simple contract that acts as a bank, allows deposits and withdrawals */

contract Bank {
    // the address of the owner
    address public owner;

    // map to store the balance of each address
    mapping(address => uint) private balances;

    event LogDepositMade(address accountAddress, uint amount);

    function Bank() public {
        owner = msg.sender;
    }

    // deposits ether into the bank
    function deposit() payable public returns(uint) {
        // prevent posible overflow in math
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        balances[msg.sender] += msg.value;
        LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    // withdraw ether
    function withdraw(uint amount) public returns(uint) {
        // has the requires ether to withdraw?
        require(amount <= balances[msg.sender]);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return balances[msg.sender];
    }

    function balance() public constant returns(uint) {
        return balances[msg.sender];
    }
}