const abi = `../artifacts/contracts/Func.sol/Func.json`
const address = item.ethAddress;
const provider = ethers.getDefaultProvider()
const func = new ethers.Contract(address, abi, provider);
const params = item.toParams
const estimation = await func.estimateGas.update(params)
