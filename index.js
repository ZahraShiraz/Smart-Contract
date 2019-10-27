const { EAC, Util } = require('@ethereum-alarm-clock/lib');
const moment = require('moment');
const web3 = Util.getWeb3FromProviderUrl('ws://localhost:8545');
const eac = new EAC(web3);
async function scheduleTransaction() {
    const receipt = await eac.schedule({
        toAddress: '0x81Eb700711a161016044F122008A6c1F0DAE3963',
                        
        windowStart: moment().add('5', 'sec').unix() // 1 day from now
    });

    const scheduledTx = eac.transactionRequestFromReceipt(receipt);

    await scheduledTx.fillData();

    console.log(`
    Address of scheduled transaction is: ${scheduledTx.address}
    It is scheduled for: ${moment.unix(scheduledTx.windowStart.toNumber()).format()}
    `);
}

scheduleTransaction();