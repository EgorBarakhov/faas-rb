const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;

const contract = require("../artifacts/contracts/Exec.sol/Exec.json");
console.log(JSON.stringify(contract.abi));

const provider = new ethers.providers.EtherscanProvider(network="sepolia", API_KEY);
const signer = new ethers.Wallet(PRIVATE_KEY, provider);
const execContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);

async function main() {
  const tx = await execContract.call("0x40D50CB5E7F42c21c849F36a21D715f4611a7Cdd", "{\"context\":\"{\"example\":\"value\"}\"");
  await tx.wait();
}
main();
