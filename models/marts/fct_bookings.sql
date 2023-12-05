select 
book_date,
book_ref,
total_amount
from {{ref('stg_airline__bookings')}}
