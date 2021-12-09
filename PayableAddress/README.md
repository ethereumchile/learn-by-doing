# When should I use a payable address?

- You'll need to use payable address when you need to withdraw ETH from your smart contract's balance to a external wallet.
- If you don't define an address variable as **_payable_** you won't be able to transfer ETH to this address.

# How can I define a payable address?

`address payable [public|private|internal] wallet`
You can find an example in this folder
