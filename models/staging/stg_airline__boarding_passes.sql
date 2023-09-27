
with source as (

    select * from {{ source('airline', 'boarding_passes') }}

),

renamed as (

    select
        ticket_no,
        flight_id,
        boarding_no,
        seat_no

    from source

)

select * from renamed