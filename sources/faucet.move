module sui_token_faucet::faucet {
    use sui::coin::{Self, Coin};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MyToken has key, store {}

    public fun init(ctx: &mut TxContext): MyToken {
        MyToken {}
    }
    public fun mint(token: &MyToken, amount: u64, ctx: &mut TxContext): Coin<MyToken> {
        coin::mint<MyToken>(amount, ctx)
    }
}
