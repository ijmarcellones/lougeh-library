create procedure update_reader(IN idreader integer, IN name character varying, IN birthdate date, IN address text)
    language plpgsql
as
$$
begin
    UPDATE reader SET
    name = $2,
    birthdate = $3,
    address = $4
   WHERE id = $1;

commit;
end;$$;

alter procedure update_reader(integer, varchar, date, text) owner to postgres;

