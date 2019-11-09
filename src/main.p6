#!/usr/bin/env perl6
use lib 'src';
use lib::Commands;
use lib::Player;

commands::register("view", {
    my $name = $_.join("/");
    my $file = ("data/files/" ~ $name).IO;

    if ($file.e) {
        say $file.slurp;
    } else {
        say "$name does not exist";
    }
});

multi MAIN(*@args) {
    commands::execute("$@args");
}

multi MAIN() {
    print "> ";
    while my $line = $*IN.get {
        commands::execute($line);
        print "> ";
    }
}