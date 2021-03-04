# CryptoStar Dapp on Ethereum Project

_This project will allow you to claim the ownership of a star._
_Token is compliant with ERC721 Token standard for nonfungible tokens_

## Tools (and it's version) used for this project ⚙️

```
truffle v5.1.67
node v11.14.0
solidity v0.6.2
openzeppelin-solidity 3.4.0
web3 1.2.4
```

## Tasks ✒️ 📄

### Task 1

- Your Project is to Modify the StarNotary version 2 contract code to achieve the following:

- Add a name and a symbol for your starNotary tokens.
  <br />
  ✔️ Completed, in openzeppelin-solidity 3.4.0, the ERC721.sol contract requires for you to pass two arguments to the constructor, a token name and a symbol, after checking the contract json representation in the build folder I can see both arguments were correctly added.
- Add a function lookUptokenIdToStarInfo, that looks up the stars using the Token ID, and then returns the name of the star.
  <br />✔️ Completed, lookUptokenIdToStarInfo function was added. test has passed. Able to get a star name when giving the id.
- Add a function called exchangeStars, so 2 users can exchange their star tokens...Do not worry about the price, just write code to exchange stars between users.
  <br />✔️ Completed, added the function exchangeStars, I tested this function in Remix and it worked, it has also passed the mocha test
- Write a function to Transfer a Star. The function should transfer a star from the address of the caller. The function should accept 2 arguments, the address to transfer the star to, and the token ID of the star.
  <br />✔️ Completed, the transferStar function is working, tested this in Remix the function has also passed the mocha test.

### Task 2

- Add supporting unit tests, to test the following:
- The token name and token symbol are added properly.
  <br />✔️By taking a look at the contract json representation I can confirm, token name and Symbol was properly added
- 2 users can exchange their stars.
  <br />✔️ Able to exchange a star between two users.
- Stars Tokens can be transferred from one address to another.
  <br />✔️ Able to transfer a token from one address to another

### Task 3

- Deploy your Contract to Rinkeby
- Edit the truffle.config file to add settings to deploy your contract to the Rinkeby Public Network.
  Helper Points:
  Command used to deploy to Rinkeby truffle migrate --reset --network rinkeby
  You will need to have your Metamask’s seed and Infura setup.
  This was shown to you in detail in the lesson on Solidity, while creating ERC-20 tokens on Rinkeby.

### Task 4

- Modify the front end of the DAPP to achieve the following:
- Lookup a star by ID using tokenIdToStarInfo() (you will have to add code for this in your index.html and index.js files)
