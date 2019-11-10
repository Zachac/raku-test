use lib::Commands;

Commands::register("view", {
    my $name = $_.join("/");
    my $file = ("data/files/" ~ $name).IO;

    if ($file.e) {
        say $file.slurp;
    } else {
        say "$name does not exist";
    }
});