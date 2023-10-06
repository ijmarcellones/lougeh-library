create procedure delete_category(IN cat_id integer)
    language plpgsql
as
$$BEGIN
    IF EXISTS( SELECT id FROM category WHERE id = cat_id) THEN
        IF EXISTS(SELECT category_id FROM books WHERE category_id = cat_id)
            THEN
                RAISE NOTICE 'A book is using this category.';
            ELSE DELETE FROM category WHERE id = $1;
        END IF;
    ELSE
        RAISE 'Category does not exist.';
    END IF;
END;
$$;

alter procedure delete_category(integer) owner to postgres;

