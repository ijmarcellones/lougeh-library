create procedure delete_transaction(IN id_transaction integer)
    language plpgsql
as
$$BEGIN

    IF EXISTS(

        SELECT id FROM book_transaction

            WHERE id = id_transaction

    ) THEN

        DELETE FROM reader

        WHERE id = $1;

    ELSE

        RAISE 'Transaction does not exist.';

    END IF;

END;

$$;

alter procedure delete_transaction(integer) owner to postgres;

