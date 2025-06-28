module sui_token_faucet::faucet {
    use sui::managed::{create_new_coin};
    use sui::coin::{TreasuryCap, mint};
    use sui::transfer::public_transfer;
    use sui::tx_context;

    public struct MyToken has key {} // use `key` instead of `drop`

    public entry fun init(ctx: &mut tx_context::TxContext) {
        let (treasury_cap, metadata) = create_new_coin(
            MyToken {},
            9,
            b"NS_FTK",
            b"Navneet's Sui Faucet Token",
            b"A custom token for testing purposes on Sui.",
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


