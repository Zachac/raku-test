#!/usr/bin/env perl6

print "> ";

while my $line = $*IN.get {
    say "echo: $line";
    print "> ";
}
