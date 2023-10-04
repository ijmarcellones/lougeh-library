create procedure add_reader(IN name character varying, IN birthdate date, IN address text)
    language plpgsql
as
$$
begin
    INSERT INTO reader (
    name,
    birthdate,
    address
  ) VALUES (
    $1,$2,$3
  );
end;$$;

alter procedure add_reader(varchar, date, text) owner to postgres;

