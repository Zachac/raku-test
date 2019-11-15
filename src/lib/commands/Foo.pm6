use lib::Commands;
use lib::io::LineWrap;
use lib::entities::Entity;
use lib::io::Serializable;

Commands::register("foo", {
    Entity.new(name => "hero", location => "root/spawn")
        .serialize("data/entities/e1");
    
    say load-type(Entity, "data/entities/e1").perl;
});