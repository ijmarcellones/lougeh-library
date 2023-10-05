create view transactions(id, return_date, name, address, copy_number, "ISBN", title) as
SELECT bt.id,
       bt.return_date,
       r.name,
       r.address,
       i.copy_number,
       b."ISBN",
       b.title
FROM book_transaction bt
         LEFT JOIN inventory i ON i.copy_number = bt.copy_number
         LEFT JOIN books b ON b."ISBN"::text = i.isbn::text
         LEFT JOIN reader r ON r.id = bt.reader_id;

alter table transactions
    owner to postgres;

