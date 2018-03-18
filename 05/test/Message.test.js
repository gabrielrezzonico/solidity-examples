var Message = artifacts.require("./Message.sol");

function ether(n) {
    return new web3.BigNumber(web3.toWei(n, 'ether'));
}

contract('Message', function (accounts) {

    let message;
    let initialPrice = ether(0.005);
    let initialMaxLength = 250;

    beforeEach('setup contract for each test', async function () {
        this.message = await Message.new(initialPrice, initialMaxLength);
    });

    it("should have initial price and max length", async function () {
        assert.equal((await this.message.price()).toNumber(), initialPrice);
        assert.equal(await this.message.maxMessageLength(), initialMaxLength);
    });

    it('should allow user to write message', async function () {
        var testMessage = 'The best message ever';
        const {logs} = await this.message.write(testMessage, {from: accounts[1], value: initialPrice});
        //console.log(logs);
        var written = await this.message.messages.call(accounts[1]);
        assert.equal(testMessage, written);
    });

    it('should fire event when writing', async function () {
        var testMessage = 'The best message ever';
        var events = await this.message.write(testMessage, {from: accounts[0], value: initialPrice});
        assert.equal(events.logs[0].event, 'MessageWrite')
    });

});