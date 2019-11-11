unit module Commands;

use lib::Player;

my %commands = (
    echo => { print "$_ " for @_; print "\n"; }
    quit => { exit }
);

grammar Command {
    token TOP { <command> [ \s* \; \s* <command> ]* \;? $ }
    token command { <name> [\s+ <argument>] * }
    token name { \w+ }
    token argument { \w+[\-\w+]* }
    token match { <?> }
}

class CommandActions {
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

class CommandExecutor is export {
    has Player $.ply;
    has CommandActions $!actions;

    method TWEAK {
        die "No player given" unless defined $.ply;
        $!actions = CommandActions.new;
    }

    method execute(Str $line) {
        Command.parse($line, actions => $!actions).made.perl;
    }
}

our sub register(Str $name, Block $code) {
    %commands{$name} = $code;
}