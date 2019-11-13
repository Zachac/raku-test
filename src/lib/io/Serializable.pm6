
class Serializable {
    has $.uuid;

    method fields returns Capture { ... };

    method serialize(Str $filename) {
        my @fields = $.fields.list;
        my $fh = open $filename, :w;

        for @fields {
            $fh.say("$_: " ~ self."$_"().perl);
        }

        $fh.close();
    }

}

