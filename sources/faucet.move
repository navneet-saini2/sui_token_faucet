module sui_token_faucet::faucet {
    use sui::coin::{TreasuryCap, create_currency, mint};
    use sui::transfer::public_transfer;
    use sui::tx_context::Self as TxContext; // Explicitly alias tx_context as TxContext to resolve warning cleanly
    use std::option::none;

    public struct MyToken has drop {}

    fun init(ctx: &mut TxContext) { // Use TxContext alias
        let (treasury_cap, metadata) = create_currency(
            MyToken {},
            9,
            b"FAUCET_RAND_XYZ_20250628_1439", // New, highly unique symbol with current timestamp
            b"Random Faucet Token Jun 28 2025 14:39", // New, highly unique name
            b"A custom token for testing purposes on Sui.",
            none(),
            ctx
        );

        public_transfer(treasury_cap, TxContext::sender(ctx)); // Use TxContext::sender
        public_transfer(metadata, TxContext::sender(ctx));    // Use TxContext::sender
    }

    public entry fun faucet(cap: &mut TreasuryCap<MyToken>, ctx: &mut TxContext) { // Use TxContext alias
        let coins = mint(cap, 10, ctx);
        public_transfer(coins, TxContext::sender(ctx)); // Use TxContext::sender
    }
}



