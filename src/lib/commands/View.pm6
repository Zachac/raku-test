use lib::Commands;
use lib::io::LineWrap;

Commands::register("view", {
    my $name = $_.join("/");
    my $file = ("data/files/" ~ $name).IO;

    if ($file.e) {
         for $file.lines {
             say $_.Str for splitLines($_, 80);
         }
    } else {
        say "$name does not exist";
    }
});