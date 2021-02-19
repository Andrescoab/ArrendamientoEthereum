const Utilidades = artifacts.require("Utilidades");
const Arrendamiento = artifacts.require("Arrendamiento");
async function doDeploy(deployer) { 
    await deployer.deploy(Utilidades); 
    await deployer.link(Utilidades, Arrendamiento); 
    await deployer.deploy(Arrendamiento);
}

module.exports = (deployer) => { 
    deployer.then(async () => { 
        await doDeploy(deployer);
    }); 
};