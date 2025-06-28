module sui_token_faucet::faucet {
    use sui::coin::{TreasuryCap, create_currency, mint};
    use sui::transfer::public_transfer;
    // Removed: use sui::tx_context; // This line is no longer needed as tx_context is implicitly available
    use std::option::none;
    use sui::tx_context::{Self, sender}; // Explicitly import for clarity if needed, otherwise just `tx_context` is fine implicitly.

    public struct MyToken has drop {}

    fun init(ctx: &mut tx_context::TxContext) {
        let (treasury_cap, metadata) = create_currency(
            MyToken {},
            9,
            b"SUIFAUCET_NAV20250628", // Changed to a highly unique symbol (includes date for guaranteed uniqueness)
            b"Navneet's Sui Test Faucet Token Jun28", // Changed to a highly unique name
            b"A custom token for testing purposes on Sui.",
            none(),
            ctx
        );

        public_transfer(treasury_cap, tx_context::sender(ctx));
        public_transfer(metadata, tx_context::sender(ctx));
    }

    public entry fun faucet(cap: &mut TreasuryCap<MyToken>, ctx: &mut tx_context::TxContext) {
        let coins = mint(cap, 10, ctx);
        public_transfer(coins, tx_context::sender(ctx));
    }
}



