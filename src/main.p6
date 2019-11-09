#!/usr/bin/env perl6
use lib 'src';
use lib::Commands;

print "> ";
while my $line = $*IN.get {
    Commands::execute($line);
    print "> ";
}
