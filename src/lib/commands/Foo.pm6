use lib::Commands;
use lib::io::LineWrap;
use lib::entities::Entity;

Commands::register("foo", {
    Entity.new(name => "hero").serialize("data/entities/e1");
});