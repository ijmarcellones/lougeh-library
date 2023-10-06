create procedure update_reader(IN id_reader integer, IN name character varying, IN birthdate date, IN address text)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(
        SELECT id FROM reader
            WHERE id = id_reader
    ) THEN
    UPDATE reader SET
        name = $2,
        birthdate = $3,
        address = $4
    WHERE id = $1;
    ELSE
        RAISE NOTICE 'Reader does not exist.';
    END IF;
COMMIT;
END
$$;

alter procedure update_reader(integer, varchar, date, text) owner to postgres;

