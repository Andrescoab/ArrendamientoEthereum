module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",//Dirección IP
      port: 7545,//Puerto
      network_id: "*" // Cualquier network id
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
}