create procedure delete_reader(IN id_reader integer)
    language plpgsql
as
$$

BEGIN

    IF EXISTS(

        SELECT id FROM reader

            WHERE id = id_reader

    ) THEN

    DELETE FROM reader

    WHERE id = $1;

    ELSE

        RAISE NOTICE 'Reader does not exist.';

    END IF;

END;

$$;

alter procedure delete_reader(integer) owner to postgres;

