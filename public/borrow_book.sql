create procedure borrow_book(IN isbn character varying, IN reader_id integer, IN book_return_date date)
    language plpgsql
as
$$
BEGIN
    INSERT INTO book_transaction (
        isbn,
        reader_id,
        book_return_date,
        status
  ) VALUES (
    $1,$2,$3, 'Borrowed'
  );
    UPDATE books b
    SET copies = b.copies - 1
    WHERE b."ISBN" = isbn;
END;
$$;

alter procedure borrow_book(varchar, integer, date) owner to postgres;

