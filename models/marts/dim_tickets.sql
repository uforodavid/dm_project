select 
ticket_no, 
book_ref,
passenger_id, 
passenger_name, 
phone_number, 
email
from {{ref('stg_airline__tickets')}}