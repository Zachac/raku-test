
class Player {
    has Str $.name;
    has @!inventory;

    method inventory() {
        return @!inventory;
    }

    method give($item) {
        push @!inventory, $item;
    }
}
