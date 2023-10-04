create view book_details(title, "ISBN", publication_year, "Publisher", "Category") as
SELECT DISTINCT b.title,
                b."ISBN",
                b.publication_year,
                p.name AS "Publisher",
                c.name AS "Category"
FROM books b
         LEFT JOIN category c ON c.id = b.category_id
         LEFT JOIN inventory i ON b."ISBN"::text = i.isbn::text
         LEFT JOIN publisher p ON i.publisher_id = p.id;

alter table book_details
    owner to postgres;

