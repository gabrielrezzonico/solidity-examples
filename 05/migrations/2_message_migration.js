var Message = artifacts.require("./Message.sol");

module.exports = function(deployer) {
  deployer.deploy(Message, 100000, 250);
};
