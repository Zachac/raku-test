#!/usr/bin/env perl6

my %commands = (
    echo => { print "$_ " for @_; print "\n"; }
    quit => { exit }
);

grammar Command {
    token TOP { <command> [ \s* \; \s* <command> ]* \;? $ }
    token command { <name> [\s+ <argument>] * }
    token name { \w+ }
    token argument { \w+ }
    token match { <?> }
}

class CommandExecutor {
    method TOP($/) { make 1 }
    method command($/) {
        my $command = %commands{"$<name>"};

        if ($command) {
            $command($<argument>);
        } else {
            say "unkown command: $<name>";
        }
    }
}

print "> ";
while my $line = $*IN.get {
    Command.parse($line, actions => CommandExecutor.new).made;
    print "> ";
}
