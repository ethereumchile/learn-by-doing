# When should I use a payable contract?

- When you're creating smart contracts to administrate funds (ICO, STO or others).
- When you want to use your Smart Contract like a wallet.

# How to receive ETH in my smart contract?

- There's a special function called `receive()`and it will let you use your Smart Contract like a wallet.
- You need to define **_receive_** with **external** and **payable**.
- If you want to learn how to start using **_receive_** check the code in this folder.

# Important

- When you want to withdraw ETH from a smart contract you need to use GAS so please don't try to withdraw all balance.
- Remember to code a function to let you withdraw.
