create table book_transaction
(
    id          serial
        primary key,
    return_date date,
    time_stamp  timestamp,
    copy_number integer
        constraint book_transaction_inventory_copy_number_fk
            references inventory,
    reader_id   integer
        constraint fk_transaction_reader
            references reader
);

alter table book_transaction
    owner to postgres;

