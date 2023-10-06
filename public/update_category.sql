create procedure update_category(IN category_id integer, IN category_name character varying)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(
        SELECT id FROM category
            WHERE id = category_id
    ) THEN
        UPDATE category SET
            name = $2
        WHERE id = $1;
    ELSE
        RAISE NOTICE 'Category does not exists.';
    END IF;
END;
$$;

alter procedure update_category(integer, varchar) owner to postgres;

