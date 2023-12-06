with tflight as (
    select
        ticket_no,
        flight_id,
        fare_conditions,
        amount
    from
        {{ref('stg_airline__ticket_flights')}}
),
flight as (
    select
        flight_id,
        flight_no,
        scheduled_departure,
        scheduled_arrival,
        departure_airport,
        arrival_airport,
        status,
        aircraft_code,
        actual_departure,
        actual_arrival
    from
        {{ref('stg_airline__flights')}}
),
boarding as (
    select 
        ticket_no,
        flight_id,
        boarding_no,
        seat_no
 from 
        {{ref('stg_airline__boarding_passes')}}
)
select
    {{ dbt_utils.generate_surrogate_key(['tflight.ticket_no', 'tflight.flight_id','boarding.boarding_no','boarding.seat_no']) }} as unique_id,
    tflight.ticket_no,
    tflight.flight_id,
    boarding.boarding_no,
    boarding.seat_no,
    fare_conditions,
    amount,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    departure_airport,
    arrival_airport,
    status,
    aircraft_code,
    actual_departure,
    actual_arrival
from
    tflight
    left join flight on tflight.flight_id = flight.flight_id 
    left join boarding on boarding.ticket_no = tflight.ticket_no