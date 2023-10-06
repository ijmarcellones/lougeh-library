create view transactions (id, book_return_date, reader_return_date, name, address, "ISBN", title, status) as
SELECT bt.id,
       bt.book_return_date,
       bt.reader_return_date,
       r.name,
       r.address,
       b."ISBN",
       b.title,
       bt.status
FROM book_transaction bt
         LEFT JOIN books b ON b."ISBN"::text = bt.isbn::text
         LEFT JOIN reader r ON r.id = bt.reader_id;

alter table transactions
    owner to postgres;

