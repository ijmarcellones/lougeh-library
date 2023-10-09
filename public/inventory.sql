create table inventory
(
    id   serial
        primary key,
    isbn varchar(255)
        constraint fk_bookinventory_book
            references books
);

alter table inventory
    owner to postgres;

