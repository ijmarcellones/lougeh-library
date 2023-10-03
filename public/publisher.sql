create table publisher
(
    id       bigserial
        primary key,
    name     varchar(255),
    location text
);

alter table publisher
    owner to postgres;

