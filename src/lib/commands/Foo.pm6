use lib::Commands;
use lib::io::LineWrap;
use lib::entities::Entity;
use lib::io::Serializable;

use DB::MySQL;

Commands::register("foo", {
    Entity.new(name => "hero", location => "root/spawn")
        .serialize("data/entities/e1");
    
    say Serializable.load(Entity, "data/entities/e1").perl;
});

my $mysql = DB::MySQL.new(:user("abc"), :password("def"), :database("yggdrasil"));

Commands::register("bar", {
    say $mysql.execute("select entity_name, entity_id from entity").hashes.perl
});