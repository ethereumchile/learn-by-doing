# When should I use a modifier?

- Modifiers are very useful when you need to **_validate_** a condition before to execute a function.
- It will help you to **_avoid to repeat code_** .
- Also it helps to **_avoid to break your code_** when you need to change your condition to validate, because **_your condition is centralized_** in one part and you don't need to change all your functions that use the same validation

# What is the purpose of modifiers?

- The purpose is to **_avoid to execute code and unnecessary spend gas_** in a transaction that will fail.
- If someone call a function with modifier and it doesn't pass the condition our smart contract will **_revert the transaction, spending 0 ETH_**.

# Important

- We will use modifiers only to validate conditions, never to re-define variables.
- You can pass parameters to your modifiers (you can find examples in this repo)
