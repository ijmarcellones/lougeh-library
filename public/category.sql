create table category
(
    id   serial
        primary key,
    name varchar
);

alter table category
    owner to postgres;

