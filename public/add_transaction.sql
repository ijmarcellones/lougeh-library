create procedure add_transaction(IN reader_id integer, IN return_date date, IN inventory_id integer)
    language plpgsql
as
$$

BEGIN

--     IF NOT EXISTS(SELECT id FROM reader)

--         THEN

--             RAISE EXCEPTION 'Reader does not exists';

--     END IF;

--

--     IF NOT EXISTS(SELECT i.copy_number FROM inventory i where i.copy_number = inventory_id)

--         THEN

--             RAISE EXCEPTION 'Book does not exists';

--     END IF;



    INSERT INTO book_transaction (

    reader_id,

    return_date,

    copy_number,

    time_stamp

  ) VALUES (

    $1,$2,$3,NOW()

  );

END;

$$;

alter procedure add_transaction(integer, date, integer) owner to postgres;

