create procedure delete_reader(IN id_reader integer)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(SELECT id FROM reader WHERE id = id_reader) THEN
        IF EXISTS(SELECT reader_id FROM book_transaction WHERE reader_id = id_reader)
        THEN
            RAISE NOTICE 'Reader has a book transaction';
        ELSE DELETE FROM reader WHERE id = $1;
        END IF;
    ELSE
        RAISE NOTICE 'Reader does not exist.';
    END IF;
END;
$$;

alter procedure delete_reader(integer) owner to postgres;

