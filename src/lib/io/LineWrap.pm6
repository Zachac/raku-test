unit module LineWrap;

grammar LineWrap {
    token TOP($cols) { 
        :my $*WS;
        :my $*COLS = $cols;
        <leading_space> <record_whitespace> [ <line> ] * 
    }
    regex line { <line_value> [<.ws>] || <line_value> }
    regex line_value {. ** { 1.. ($*COLS - $*WS) }}
    token record_whitespace { { $*WS = self.pos } }
    token leading_space { \s* }
}

sub splitLines (Str $line, int $cols) is export {
    return $line if $line.chars < $cols;

    my @lines = ();
    my $match = LineWrap.parse($line, args => \($cols));

    for $match<line> {
        push @lines, (@lines > 0 ?? "  " !! "") ~ $match<leading_space> ~ $_;
    }

    return @lines;
}
