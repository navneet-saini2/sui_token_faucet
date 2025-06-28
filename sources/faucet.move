module sui_token_faucet::faucet {
    use sui::coin::{Self, TreasuryCap, Coin, create_currency, mint};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::option;

    // Struct must include `id: UID` if using `key`
    struct MyToken has key {
        id: object::UID,
    }

    // Internal function to initialize the custom token
    fun init(ctx: &mut TxContext): (TreasuryCap<MyToken>, object::Object) {
        let (treasury, metadata) = create_currency<MyToken>(
            9,
            b"SUIFTK_JUNE28_V151",
            b"Navneet Faucet Token",
            b"A test token for faucet use on Sui v1.51.1",
            option::none(),
            ctx
        );
        (treasury, metadata)
    }

    // Public entry faucet function to mint and send tokens
    public entry fun faucet(cap: &mut TreasuryCap<MyToken>, ctx: &mut TxContext) {
        let coin: Coin<MyToken> = mint(cap, 10, ctx);
        transfer::public_transfer(coin, TxContext::sender(ctx));
    }
}



