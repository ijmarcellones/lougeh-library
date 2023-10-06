create procedure update_publisher(IN publisher_id integer, IN publisher_name character varying, IN publisher_location text)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(
        SELECT id FROM publisher
            WHERE id = publisher_id
    ) THEN
        UPDATE publisher SET
            name = $2,
            location = $3
        WHERE id = $1;
    ELSE
        RAISE NOTICE 'Publisher does not exists.';
    END IF;
END;
$$;

alter procedure update_publisher(integer, varchar, text) owner to postgres;

