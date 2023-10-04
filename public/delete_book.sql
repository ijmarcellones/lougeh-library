create procedure delete_book(IN id_book character varying)
    language plpgsql
as
$$BEGIN
    DELETE FROM books
    WHERE "ISBN" = $1;

END;
$$;

alter procedure delete_book(varchar) owner to postgres;

