
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

    submethod load($type, Str $filename) is export {
        my %map = load-yaml($filename.IO.slurp);
        return $type.new(|%map);
    }
}


