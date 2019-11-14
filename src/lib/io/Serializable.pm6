
use YAMLish;

class Serializable {
    has $.uuid;

    method fields() returns Array { ... };

    method serialize(Str $filename) {
        my @fields = self.fields;

        my %map;
        %map{ $_ } = self."$_"() for self.fields;

        my $fh = open $filename, :w;
        $fh.say(save-yaml(%map));
        $fh.close();
    }

    method load(Str $filename) {
        
    }

}

