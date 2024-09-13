const deployChainBattles = require("./deploy/00_deploy_chain_battles");
const verifyChainBattles = require("./deploy/01_verify_chain_battles");

async function main() {
  // Deploy the ChainBattles contract
  const chainBattles = await deployChainBattles();

  // Optionally verify the contract on Etherscan (for Sepolia, etc.)
  if (chainBattles.address) {
    await verifyChainBattles(chainBattles.address);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
