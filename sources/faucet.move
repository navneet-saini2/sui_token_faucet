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
    public fun faucet(token: &MyToken, ctx: &mut TxContext){
        let coins = coin::mint<MyToken>(1000, ctx);
        let recipient = tx_context::sender(ctx);
        transfer::public_transfer(coins, recipient);
    }
}
