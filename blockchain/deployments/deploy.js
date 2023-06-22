async function main() {
  const Func = await ethers.getContractFactory("Func");
  const func = await Func.deploy();
  console.log("Contract Deployed to Address:", func.address);
}
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
