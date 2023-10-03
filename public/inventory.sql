create table inventory
(
    isbn         varchar(255)
        constraint "inventory_books_ISBN_fk"
            references books,
    publisher_id bigint
        constraint fk_inventory_publisher
            references publisher,
    copy_number  serial
        constraint inventory_pk
            primary key
);

alter table inventory
    owner to postgres;

