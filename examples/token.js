eth.defaultAccount = eth.coinbase;
var abi = [{"constant":false,"inputs":[{"name":"","type":"address"},{"name":"","type":"uint256"}],"name":"transfer","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"","type":"address"},{"name":"","type":"address"},{"name":"","type":"uint256"}],"name":"transferFrom","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"","type":"address"},{"name":"","type":"uint256"}],"name":"approve","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"output","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"},{"name":"","type":"address"}],"name":"allowance","outputs":[{"name":"output","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"output","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"output","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"output","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"output","type":"uint256"}],"payable":false,"type":"function"},{"inputs":[],"payable":false,"type":"constructor"},{"payable":true,"type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_owner","type":"address"},{"indexed":true,"name":"_spender","type":"address"},{"indexed":false,"name":"_value","type":"uint256"}],"name":"Approval","type":"event"}];
var data = '0x7fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef6020557f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92560405563631000006060556363100000326020015532608055602862010000557f73686974636f696e73686974636f696e73686974636f696e73686974636f696e62010020557f73686974636f696e0000000000000000000000000000000000000000000000006201004055600362020000557f73686300000000000000000000000000000000000000000000000000000000006202002055601260a0556102328060ef6000396000f360e060020a600035048063a9059cbb14606a57806323b872dd146087578063095ea7b31460de57806370a082311461010f578063dd62ed3e1461012757806306fdde031461014657806395d89b411461016e578063313ce56714610196576318160ddd146101a2575b005b60043560c05260243560e052336101005260856000526101c8565b005b6004356101005260243560c05260443560e05260a46000526101ae565b6101205160e051116102305760e05161012051036101205260c0516101005103610140526101405161012051905560dc6000526101c8565b005b6004356101605260243560e052610160513303610140526101405160e051905560e0516101605133604054602080a3005b60043560805260805160200154610180526020610180f35b6004356101005260243560c05261013f6000526101ae565b6020610120f35b620100005b8080549052602001805461014b5762010000600052620100008051016020016000f35b620200005b808054905260200180546101735762020000600052620200008051016020016000f35b60a080549052602060a0f35b60608054905260206060f35b60c051610100510361014052610140515461012052600051565b61010051602001546101a0526101a05160e051116102305760c051602001546101c05260e0516101a051036101a05260e0516101c051016101c0526101a05161010051602001556101c05160c0516020015560e05160c05161010051602054602080a3600051565b00';
var aContract = web3.eth.contract(abi);
var con = aContract.new({from: web3.eth.accounts[0], data: data, gas: '4700000'}, function (e, contract){console.log(e, contract); if (typeof contract.address !== 'undefined'){console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash); var events = con.allEvents(); events.watch(function(error, event){ if (!error) console.log("EVENT:\n", JSON.stringify(event));});}})
