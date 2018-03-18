pragma solidity 0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Storage.sol";

contract TestStorage {
  function testInitialBalanceUsingDeployedContract() {
    Storage meta = Storage(DeployedAddresses.Storage());

    uint expected = 0;

    Assert.equal(meta.get(), expected, "Should be 0 initially");
  }
}