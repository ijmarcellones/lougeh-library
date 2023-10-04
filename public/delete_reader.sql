create procedure delete_reader(IN id_reader integer)
    language plpgsql
as
$$BEGIN
    DELETE FROM reader
    WHERE id = $1;

END;
$$;

alter procedure delete_reader(integer) owner to postgres;

