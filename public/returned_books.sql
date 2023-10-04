create view returned_books(return_date, copy_number, "ISBN", title, name) as
SELECT bt.return_date,
       i.copy_number,
       b."ISBN",
       b.title,
       r.name
FROM book_transaction bt
         LEFT JOIN inventory i ON i.copy_number = bt.copy_number
         LEFT JOIN books b ON b."ISBN"::text = i.isbn::text
         LEFT JOIN reader r ON r.id = bt.reader_id;

alter table returned_books
    owner to postgres;

