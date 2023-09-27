with source as (

    select * from {{ source('airline', 'bookings') }}

),

renamed as (

    select
        book_ref,
        book_date,
        total_amount

    from source

)

select * from renamed