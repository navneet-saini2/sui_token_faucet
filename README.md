# 💧 Sui Token Faucet

A smart contract built on the [Sui blockchain](https://sui.io/) that allows users to claim custom tokens using a faucet-style function.

## 🧱 Contract Overview

This contract defines a custom token (`MyToken`) and a faucet function that mints and transfers a small amount of tokens to any user who calls it.

### 🔧 Functions

- `init(ctx)`  
  Creates a new `MyToken` with metadata and a treasury cap, then transfers both to the deployer's address.

- `faucet(cap, ctx)`  
  Allows any user to mint and receive 10 `MyToken` coins from the treasury.

### 🧪 Token Details

- **Name:** MyToken  
- **Symbol:** MTK  
- **Decimals:** 9  
- **Supply Control:** Faucet-based, no max cap

## 🛠️ Built With

- [Move language](https://move-language.github.io/)
- [Sui Framework](https://docs.sui.io/)
- [Sui CLI](https://docs.sui.io/build/install)

## 🚀 What's Next

- 🔁 Testing faucet via CLI
- 🧪 Deploy to Sui Devnet
- 🌐 Frontend integration with Suiet wallet
- ⚙️ Optional: add claim limits or cooldowns

## 📁 Project Structure

```bash
sui_token_faucet/
├── sources/
│   └── faucet.move      # Main contract module
├── Move.toml            # Project manifest
└── README.md            # You're reading it 🙂

