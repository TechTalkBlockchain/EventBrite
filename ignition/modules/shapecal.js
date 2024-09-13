const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("shapecalModule", (m) => {
  // Deploy the AreaCalculator contract
  const shapecal = m.contract("shapecal");

  // Return the deployed contract so it can be accessed later
  return { shapecal };
});