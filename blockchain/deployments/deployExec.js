async function main() {
  const Exec = await ethers.getContractFactory("Exec");
  const exec = await Exec.deploy();
  console.log("Contract Deployed to Address:", exec.address);
}
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
