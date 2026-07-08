-- query 1
SELECT
  match_id,
  fixture,
  base_ticket_price
FROM
  matches
WHERE
  tournament_category = 'Champions League'
  AND match_status = 'Available';

-- query 2
SELECT
  user_id,
  full_name,
  email
FROM
  users
WHERE
  full_name ILIKE ('Tanvir%')
  OR full_name ILIKE ('%haque%');

-- query 3
SELECT
  booking_id,
  user_id,
  match_id, 
  COALESCE(payment_status, 'Action Required') as "systematic_status"
FROM
  bookings
WHERE
  payment_status IS NULL;

-- query 4
SELECT
  booking_id, full_name, fixture, total_cost 
FROM
  bookings
INNER JOIN 
  users
ON
  bookings.user_id = users.user_id
INNER JOIN
  matches
ON
  bookings.match_id = matches.match_id;

-- query 5
SELECT
  users.user_id, full_name, booking_id
FROM
  users
LEFT JOIN 
  bookings
ON
  bookings.user_id = users.user_id

-- query 6
SELECT
  booking_id,
  match_id,
  total_cost
FROM
  bookings
WHERE
  total_cost > (
    SELECT
      AVG(total_cost)
    FROM
      bookings
  );

-- query 7
SELECT
  match_id,
  fixture,
  base_ticket_price
FROM
  matches
ORDER BY
  base_ticket_price DESC
LIMIT
  2
OFFSET
  1
