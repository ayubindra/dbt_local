{{ config(materialized='table', schema='xkndwh') }}

with customer_behavior as (
    SELECT
    C.customer_id,
    B.genre_id,
    D.year AS sale_year,
    D.month AS sale_month,
    SUM(S.quantity_sold) AS total_quantity_sold,
    SUM(S.total_sales_amount) AS total_sales_amount
    FROM
        latihan.xknref.ref_salesfact as S
    JOIN
        latihan.xknref.ref_customerdim C ON S.customer_id = C.customer_id
    JOIN
        latihan.xknref.ref_bookdim B ON S.book_id = B.book_id
    JOIN
        latihan.xknref.ref_datedim D ON S.date_id = D.date_id
    GROUP BY
        C.customer_id, B.genre_id, D.year, D.month
),

final as (
    select * from customer_behavior
)

select * from final