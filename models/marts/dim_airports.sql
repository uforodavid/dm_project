select
    airport_code,
    airport_english_name,
    airport_russian_name,
    city_english_name,
    city_russian_name,
    timezone_continent,
    timezone_city,
    coordinates
from
    {{ref('stg_airline__airports_data')}}