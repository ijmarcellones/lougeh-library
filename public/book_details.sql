create view book_details
            (title, "ISBN", author, publication_year, "PublisherID", "Publisher", "CategoryID", "Category",
             shelf_location, pages, copies)
as
SELECT b.title,
       b."ISBN",
       b.author,
       b.publication_year,
       p.id   AS "PublisherID",
       p.name AS "Publisher",
       c.id   AS "CategoryID",
       c.name AS "Category",
       b.shelf_location,
       b.pages,
       b.copies
FROM books b
         LEFT JOIN category c ON c.id = b.category_id
         LEFT JOIN publisher p ON b.publisher_id = p.id;

alter table book_details
    owner to postgres;

