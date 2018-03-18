pragma solidity 0.4.19;

contract Storage {
  uint variable;

  function set(uint x) public {
    variable = x;
  }

  function get() constant public returns (uint) {
    return variable;
  }
}