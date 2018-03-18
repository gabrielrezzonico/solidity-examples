pragma solidity 0.4.19;

import './Ownable.sol';

contract Message is Ownable {
    uint public price;
    uint8 public maxMessageLength;

    mapping(address => string) public messages;

    event MessageWrite(string message, address writer);

    function Message(uint _price, uint8 _maxMessageLength) public {
        price = _price;
        maxMessageLength = _maxMessageLength;
    }

    function write(string message) public payable {
        require(msg.value >= price);
        require(bytes(message).length < maxMessageLength && bytes(message).length > 0);
        require(bytes(messages[msg.sender]).length == 0);
        messages[msg.sender] = message;
        MessageWrite(message, msg.sender);
    }

    function withdraw(uint amount) external onlyOwner {
        owner.transfer(amount);
    }
}