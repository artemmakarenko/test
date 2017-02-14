# Document as to Dashboard

Query

Note, that each statement includes predicate in form bucket = cast(truncate(to_unixtime(current_timestamp - interval '10' second) / 60) as bigint) AND ts >= current_timestamp - interval '10' second

Global active users count

SELECT sum(active_users)
FROM cassandra.bit.user_activity
WHERE bucket = cast(truncate(to_unixtime(current_timestamp - interval '10' second) / 60) as bigint) AND ts >= current_timestamp - interval '10' second;

Global total events for 30 mins with update time for the last 10 seconds

SELECT sum(hits) as total_hits
FROM cassandra.bit.events
WHERE bucket = cast(truncate(to_unixtime(current_timestamp - interval '10' second) / 60) as bigint) AND ts >= current_timestamp - interval '10' second;
