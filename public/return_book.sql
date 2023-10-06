create procedure return_book(IN book_transaction_id integer, IN reader_return_date date, IN isbn character varying)
    language plpgsql
as
$$
BEGIN
    UPDATE book_transaction bt
    SET reader_return_date = $2,
    status = 'Returned'
    WHERE id = $1;

    UPDATE books b
    SET copies = b.copies + 1
    WHERE b."ISBN" =  isbn;
END;
$$;

alter procedure return_book(integer, date, varchar) owner to postgres;

