use lib::io::Serializable;


class Entity is Serializable {
    has $.location;
    has $.name;
    has $.description;

    method fields returns Capture {
        return \("location", "name", "description");
    }
}
