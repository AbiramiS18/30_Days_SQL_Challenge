WITH cte AS
    (SELECT t.* FROM Trips t JOIN Users u
            ON u.banned = "No"
            AND (u.users_id = t.client_id
                OR u.users_id = t.driver_id)
        GROUP BY t.id HAVING COUNT(t.id)=2)
SELECT request_at `Day`,
        ROUND(
            SUM(IF(status="cancelled_by_driver" OR
                   status="cancelled_by_client",1,0)) /
            count(request_at),2) `Cancellation Rate`
    FROM cte
    WHERE request_at BETWEEN "2013-10-01" AND "2013-10-03"
    GROUP BY Day