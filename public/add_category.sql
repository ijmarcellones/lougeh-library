create procedure add_category(IN category_name character varying)
    language plpgsql
as
$$
BEGIN
    IF EXISTS(
        SELECT id FROM category
            WHERE name = category_name
    ) THEN
        RAISE NOTICE 'Category already exists.';
    ELSE
        INSERT INTO category (
            name
    )   VALUES (
            $1
    );
    END IF;
END;
$$;

alter procedure add_category(varchar) owner to postgres;

