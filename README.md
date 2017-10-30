# POINT Token Smart Contract
This repo contains the smart contract for the POINT Token System. The POINT Token System is a multi-tenant, decentralized loyalty and rewards system that runs on the Ethereum Blockchain.

To learn more about the POINT Token System, go to  [http://www.pointtoken.io](http://www.pointtoken.io). The website has a white paper which thoroughly outlines how the system works. 


## Installation
If all you want to do is read the contract, there is no installation required; just go to  **contracts\PointToken.sol**. 

If you want to run the contract locally or run the tests, you need to install  [Truffle](http://truffleframework.com/):

```bash
npm install -g truffle
```
You also need to install testrpc for running the tests:
```bash
npm install -g ethereumjs-testrpc
```
Lastly, you need to do an npm install on the repo itself:

```bash
npm install
```
## The Contract
The contract itself relies on the inheritance feature of Solidity to pull in several other Solidity files, all from the [Open Zeppelin](https://github.com/OpenZeppelin/zeppelin-solidity) project. You can read these files by drilling into the **node_modules\zeppelin-solidity** directory. For understanding the logic of the POINT Token code itself, see the  [POINT Token white paper](http://www.pointtoken.io).
## Running Tests

To run the unit tests on the contract, run
```bash
truffle test
```
Make sure that testrpc is running before you run the tests.