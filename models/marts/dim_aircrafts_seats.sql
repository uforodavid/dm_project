select
    a.aircraft_code,
    english_model,
    russian_model,
    range,
    seat_no,
    fare_conditions
from
    {{ref('stg_airline__aircraft_data')}} a
    left join {{ref('stg_airline__seats')}} s on a.aircraft_code = s.aircraft_code