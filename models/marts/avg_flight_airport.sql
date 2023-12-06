

select
    ar.airport_english_name as departure_airport,
    avg(actual_arrival - actual_departure) as avg_flight_time,
    count(flight_id) as number_of_flights
from
    {{ref('fct_flights')}} f
    left join {{ref('dim_airports')}} ar 
    on f.departure_airport = ar.airport_code
group by
    ar.airport_english_name
