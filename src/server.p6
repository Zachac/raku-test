#!/usr/bin/env perl6
use lib 'src';
use lib::Commands;
use lib::Env;


sub MAIN() {
    my $s = IO::Socket::INET.new(:locahost('localhost') :localport(3329), :listen(True));

    if my $c = $s.accept()  {
        say "Accepting client";
        $*OUT = IO::Pipe.new( :on-close({ $c.close }), :on-write({ $c.write($_) }));
        Commands::execute($_) for $c.lines;
        say "finished client";
    }
}

