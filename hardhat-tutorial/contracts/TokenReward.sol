  // SPDX-License-Identifier: MIT
  pragma solidity ^0.8.4;

  import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
  import "@openzeppelin/contracts/access/Ownable.sol";

  contract TokenReward is ERC20 {

 // the amount of token given as reward
   uint256 public constant tokenReward = 10 * 10**18;     

 // the max total supply is 10000 for LauCoin
   uint256 public constant maxTotalSupply = 700 * 10**18;

   address owner = msg.sender;

   constructor () ERC20("TokenReward", "TKR") {
       _mint(msg.sender, maxTotalSupply);
   }

   function reward(uint256 amount) public payable {
       require(owner != msg.sender, "You are the owner of the tokens");
       require(totalSupply() < maxTotalSupply);
       _mint(msg.sender, tokenReward);

   }

// Function to receive Ether. msg.data must be empty
   receive() external payable {}

// Fallback function is called when msg.data is not empty
   fallback() external payable {}

  }