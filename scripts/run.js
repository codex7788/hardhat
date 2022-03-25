const hre = require("hardhat");

async function main() {

  const SimpleNFTFactory = await hre.ethers.getContractFactory("SimpleNFT");
  const simpleNft = await SimpleNFTFactory.deploy();

  await simpleNft.deployed();

  console.log("SimpleNFT deployed to:", simpleNft.address);

  let txn = await simpleNft.mintNFT();
  await txn.wait();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
