create procedure update_book(IN isbn character varying, IN title character varying, IN publication_year integer, IN author text, IN pages integer, IN shelf_location character varying, IN category_id integer)
    language plpgsql
as
$$
BEGIN
    UPDATE books SET
    title = $2,
    publication_year = $3,
    author = $4,
    pages = $5,
    shelf_location = $6,
    category_id = $7
   WHERE "ISBN" = $1;
END;
$$;

alter procedure update_book(varchar, varchar, integer, text, integer, varchar, integer) owner to postgres;

