create procedure add_book(IN isbn character varying, IN title character varying, IN publication_year integer, IN author text, IN pages integer, IN shelf_location character varying, IN category_id integer, IN publisher_id integer, IN copies integer)
    language plpgsql
as
$$
BEGIN
    IF EXISTS (
      SELECT *
      FROM books
      WHERE "ISBN" = ISBN
  ) THEN
    RAISE NOTICE 'ISBN already exists.';
  ELSE
    INSERT INTO books (
    "ISBN",
    title,
    publication_year,
    author,
    pages,
    shelf_location,
    category_id,
    publisher_id,
    copies
  ) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9
  );
  END IF;
END
$$;

alter procedure add_book(varchar, varchar, integer, text, integer, varchar, integer, integer, integer) owner to postgres;

