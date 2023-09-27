with source as (

    select * from {{ source('airline', 'aircrafts_data') }}

),

renamed as (

    select
        aircraft_code,
        (model->>'en') as english_model,
        (model->>'ru') as russian_model,
        range

    from source

)

select * from renamed