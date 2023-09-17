with salesanalysis_dmart as (
    SELECT
    S.date_id,
    S.book_id,
    B.author_id,
    B.genre_id,
    B.publisher_id,
    D.year AS sale_year,
    D.month AS sale_month,
    SUM(S.quantity_sold) AS total_quantity_sold,
    SUM(S.total_sales_amount) AS total_sales_amount
    FROM
        latihan.xknref.ref_salesfact as s
    JOIN
        latihan.xknref.ref_bookdim as B ON S.book_id = B.book_id
    JOIN
        latihan.xknref.ref_datedim D ON S.date_id = D.date_id
    GROUP BY
        S.date_id, S.book_id, B.author_id, B.genre_id, B.publisher_id, D.year, D.month
),

final as (
    select * from salesanalysis_dmart
)

select * from final