create procedure delete_book(IN id_book character varying)
    language plpgsql
as
$$

BEGIN

    IF EXISTS (

      SELECT *

      FROM books

      WHERE "ISBN" = id_book

  ) THEN

     DELETE FROM books

    WHERE "ISBN" = $1;

     ELSE

    RAISE EXCEPTION 'Book does not exist.';

  END IF;

END;

$$;

alter procedure delete_book(varchar) owner to postgres;

