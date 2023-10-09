create table book_transaction
(
    id                 serial
        primary key,
    reader_return_date date,
    reader_id          integer
        constraint fk_transaction_reader
            references reader,
    isbn               varchar(255)
        constraint fk_booktransaction_book
            references books
            on delete cascade,
    book_return_date   date,
    status             varchar(50)
);

alter table book_transaction
    owner to postgres;

