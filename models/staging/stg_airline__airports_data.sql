with source as (

    select * from {{ source('airline', 'airports_data') }}

),

renamed as (

    select
        airport_code,
        (airport_name->>'en') AS airport_english_name,
         (airport_name->>'ru') AS airport_russian_name,
	    (city->>'en') AS city_english_name,
        (city->>'ru') AS city_russian_name,
	    split_part(timezone,'/',1) as timezone_continent,
        split_part(timezone,'/',2) as timezone_city,
        coordinates



    from source

)

select * from renamed

