#!/usr/bin/env perl6
use lib 'src';
use lib::Commands;
use lib::Env;

multi MAIN(*@args) {
    Commands::execute("$@args");
}

multi MAIN() {
    print "> ";
    while my $line = $*IN.get {
        Commands::execute($line);
        print "> ";
    }
}