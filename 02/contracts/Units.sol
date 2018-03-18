pragma solidity 0.4.19;

contract Units {
  function Units() public {
    require(1 szabo == 1000000000000 wei);
    require(1 finney == 1000 szabo);
    require(1 ether == 1000 finney);

    require(1 == 1 seconds);
    require(1 minutes == 60 seconds);
    require(1 hours == 60 minutes);
    require(1 days == 24 hours);
    require(1 weeks == 7 days);
    require(1 years == 365 days);
  }
}