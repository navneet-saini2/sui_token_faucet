module sui_token_faucet::faucet {
    use sui::coin::{TreasuryCap, create_currency, mint};
    use sui::transfer::public_transfer;
    use sui::tx_context::Self as TxContext;
    use std::option::none;

    // Add the 'key' ability to MyToken
    public struct MyToken has drop, store, key {} // Added 'key' ability

    fun init(ctx: &mut TxContext) {
        let (treasury_cap, metadata) = create_currency(
            MyToken {},
            9,
            b"MTK", // Updated symbol to MTK
            b"MyToken", // Updated name to MyToken
            b"A custom token created by Navneet for testing purposes on Sui.",
            none(),
            ctx
        );

        public_transfer(treasury_cap, TxContext::sender(ctx));
        public_transfer(metadata, TxContext::sender(ctx));
    }

    public entry fun faucet(cap: &mut TreasuryCap<MyToken>, ctx: &mut TxContext) {
        let coins = mint(cap, 10, ctx);
        public_transfer(coins, TxContext::sender(ctx));
    }
}


