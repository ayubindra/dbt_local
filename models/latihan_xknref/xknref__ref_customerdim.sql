with ref_customerdim as (
    select * from {{ source('latihan', 'ref_customerdim') }}
),

final as (
    select * from ref_customerdim
)

select * from final