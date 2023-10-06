create table books
(
    "ISBN"           varchar(255) not null
        primary key,
    title            varchar(255) not null,
    publication_year integer,
    author           text,
    pages            integer,
    shelf_location   varchar(255),
    category_id      integer
        constraint books_category_id_fk
            references category,
    publisher_id     integer
        constraint fk_book_publisher
            references publisher,
    copies           integer
);

alter table books
    owner to postgres;

