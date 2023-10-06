create procedure add_publisher(IN publisher_name character varying, IN publisher_location text)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(
        SELECT id FROM publisher
            WHERE name = publisher_name
    ) THEN
        RAISE NOTICE 'Publisher already exists.';
    ELSE
        INSERT INTO publisher (
            name,
            location
    )   VALUES (
            $1,$2
    );
    END IF;
END;
$$;

alter procedure add_publisher(varchar, text) owner to postgres;

