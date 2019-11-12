unit module LineWrap;


sub splitLines (Str $line, int $cols) is export {
    return $line unless $line;
    return $line ~~ m:g/ . ** {1..$cols} [<<]? /
}
