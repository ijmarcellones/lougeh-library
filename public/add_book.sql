create procedure add_book(IN isbn character varying, IN title character varying, IN publication_year integer, IN author text, IN pages integer, IN shelf_location character varying, IN category_id integer)
    language plpgsql
as
$$
begin
    INSERT INTO books (
    "ISBN",
    title,
    publication_year,
    author,
    pages,
    shelf_location,
    category_id
  ) VALUES (
    $1,
    $2,
    $3,
    $4,
    $5,
    $6,
    $7
  );
end;$$;

alter procedure add_book(varchar, varchar, integer, text, integer, varchar, integer) owner to postgres;

