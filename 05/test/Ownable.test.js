var Ownable = artifacts.require("./Ownable.sol");

contract('Ownable', function ([messageOwner, user]) {

    let ownable;

    beforeEach('setup contract for each test', async function () {
        this.ownable = await Ownable.new({ from: messageOwner });
    });

    it('should have an owner', async function () {
        let owner = await this.ownable.owner();
        assert.isTrue(owner !== 0);
    });

    it('owner should be set to the sender', async function () {
        let owner = await this.ownable.owner();
        assert.isTrue(owner == messageOwner);
    });
});
