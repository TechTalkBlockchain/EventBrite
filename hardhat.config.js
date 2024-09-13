require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");


/** @type import('hardhat/config').HardhatUserConfig */


module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: process.env.ALCHEMY_TEST_URL,
      accounts: [process.env.TESTNET_PRIVATE_KEY]
    }
  }, 
  etherscan:{
    apiKey: process.env.ETHER_SCAN_API_KEY
  }
    
};