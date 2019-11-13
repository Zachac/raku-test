use lib::io::Serializable;


class Entity is Serializable {
    has $.location;
    has $.name;
    has $.description;

    method fields {
        return "location", "name", "description";
    }
}
