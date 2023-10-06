create procedure add_book(IN isbn character varying, IN title character varying, IN publication_year integer, IN author text, IN pages integer, IN shelf_location character varying, IN category_id integer)
    language plpgsql
as
$$
BEGIN
    IF EXISTS (
      SELECT *
      FROM books
      WHERE "ISBN" = ISBN
  ) THEN
    RAISE EXCEPTION 'ISBN already exists.';
  ELSE
    INSERT INTO books (
    "ISBN",
    title,
    publication_year,
    author,
    pages,
    shelf_location,
    category_id
  ) VALUES (
    $1,$2,$3,$4,$5,$6,$7
  );
  END IF;
END
$$;

alter procedure add_book(varchar, varchar, integer, text, integer, varchar, integer) owner to postgres;

