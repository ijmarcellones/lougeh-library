create procedure delete_publisher(IN pub_id integer)
    language plpgsql
as
$$BEGIN
    IF EXISTS( SELECT id FROM publisher WHERE id = pub_id) THEN
        IF EXISTS(SELECT publisher_id FROM books WHERE publisher_id = pub_id)
        THEN
            RAISE NOTICE 'A book is published by this publisher.';
        ELSE DELETE FROM publisher WHERE id = $1;
        END IF;
    ELSE
        RAISE NOTICE 'Publisher does not exist.';
    END IF;
END;
$$;

alter procedure delete_publisher(integer) owner to postgres;

