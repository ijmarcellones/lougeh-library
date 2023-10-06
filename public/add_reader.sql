create procedure add_reader(IN reader_name character varying, IN reader_birthdate date, IN address text)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(
        SELECT id FROM reader
            WHERE name = $1 AND birthdate = $2
    ) THEN
        RAISE NOTICE 'Reader already exists.';
        ELSE

        INSERT INTO reader (
    name,
    birthdate,
    address
  ) VALUES (
    $1,$2,$3
  );
    END IF;
END;
$$;

alter procedure add_reader(varchar, date, text) owner to postgres;

