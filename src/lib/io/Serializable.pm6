
class Serializable {
    has $.uuid;

    method fields() returns Array { ... };

    method serialize(Str $filename) {
        my @fields = self.fields;

        my $fh = open $filename, :w;

        for @fields {
            $fh.say("$_: " ~ self."$_"().perl);
        }

        $fh.close();
    }

}

