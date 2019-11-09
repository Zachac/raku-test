unit module player;

use lib::Commands;

class Player is export {
    has Str $.name;
    has @!inventory;

    method inventory() {
        return @!inventory;
    }

    method give($item) {
        push @!inventory, $item;
    }
}
