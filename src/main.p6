#!/usr/bin/env perl6
use lib 'src';
use lib::Commands;
use lib::Env;
use lib::Player;

multi MAIN(*@args) {
    my $commandLine = CommandExecutor.new(ply => Player.new);

    $commandLine.execute("$@args");
}

multi MAIN() {
    my $commandLine = CommandExecutor.new(ply => Player.new);

    print "> ";
    while my $line = $*IN.get {
        $commandLine.execute($line);
        print "> ";
    }
}