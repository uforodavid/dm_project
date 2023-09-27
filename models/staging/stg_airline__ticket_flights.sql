with source as (

    select * from {{ source('airline', 'ticket_flights') }}

),

renamed as (

    select
        ticket_no,
        flight_id,
        fare_conditions,
        amount

    from source

)

select * from renamed