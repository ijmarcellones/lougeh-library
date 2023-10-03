create table reader
(
    id        serial
        primary key,
    name      varchar(255),
    birthdate date,
    address   text
);

alter table reader
    owner to postgres;

