
with source as (

    select * from {{ source('airline', 'seats') }}

),

renamed as (

    select
        aircraft_code,
        seat_no,
        fare_conditions

    from source

)

select * from renamed
