#!/usr/bin/env perl6
use NativeCall;

sub sum(int32, int32) returns int32 is native("./libexample.so") { * }

multi MAIN() {

    say sum(2, 3);

}