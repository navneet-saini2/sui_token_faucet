module sui_token_faucet::faucet {
    use sui::coin::{TreasuryCap, create_currency, mint};
    use sui::transfer::public_transfer;
    use sui::tx_context;
    use std::option::none;

    public struct MyToken has drop {}

    fun init(ctx: &mut tx_context::TxContext) {
        let (treasury_cap, metadata) = create_currency(
            MyToken {},
            9,
            b"NAVETK", // Changed to a unique symbol
            b"Navneet's Custom Token", // Changed to a unique name
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

