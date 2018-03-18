var Bank = artifacts.require("./Bank.sol");

contract('Bank', function ([owner, user]) {

    let bank;

    beforeEach('setup contract for each test', async function () {
        this.bank = await Bank.new({from: owner});
    })

    it('has an owner', async function () {
        assert.equal(await this.bank.owner(), owner);
    })

    it('user account should have a balance of 0', async function(){
        assert.equal(await this.bank.balance({from: user}), 0);
    })

    it('User should be able to deposit money it his account', async function(){
        var money = 10;
        await this.bank.deposit({from: user, value: money});
        assert.equal(await this.bank.balance({from: user}), money);
    })
});
