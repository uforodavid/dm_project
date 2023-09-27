
with source as (

    select * from {{ source('airline', 'tickets') }}

),

renamed as (

    select
        ticket_no,
        book_ref,
        passenger_id,
        passenger_name,
        (contact_data->>'phone') AS phone_number,
        (contact_data->>'email') AS email

    from source

)

select * from renamed