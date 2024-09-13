const { buildModule } = require('@nomicfoundation/ignition-core');
 
  const nftContractAddress = "0xBa851Fc4EcD66aa37fF7EF72294245E373ea9BbC";

  module.exports = buildModule('EventBriteModule', (m) => {
    const chainBattlesevent = m.contract('EventBrite', [nftContractAddress]);  // Define the contract
  });

  