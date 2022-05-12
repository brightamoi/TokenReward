const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

async function main() {
  const TokenRewardContract = await ethers.getContractFactory("TokenReward");

  // deploy the contract
  const deployedTokenRewardContract = await TokenRewardContract.deploy();

  // print the address of the deployed contract
  console.log(
    "REWARD Token Contract Address:",
    deployedTokenRewardContract.address
  );
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
