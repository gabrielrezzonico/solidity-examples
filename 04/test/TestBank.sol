pragma solidity 0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Bank.sol";

contract TestBank {
  function testInitialBalanceUsingDeployedContract() public {
    Bank bank = Bank(DeployedAddresses.Bank());

    uint expected = 0;

    Assert.equal(bank.balance(), expected, "Should be 0 initially");
  }
}