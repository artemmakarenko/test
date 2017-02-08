# connection: "presto_dev_env"
connection: "presto_db_connection_stg"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: user_activity_emr {
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  and (ts >= current_timestamp - interval '20' second);;
  join: user_activity_derive {
    sql_on: ${user_activity_emr.ts_raw}=${user_activity_derive.ts_raw} ;;
    relationship: many_to_one
  }
  join: countries {
    sql_on: lower(${user_activity_emr.country})=lower(${countries.name}) ;;
    relationship: many_to_one
  }
}
explore: hits_per_minute_emr {
  sql_always_where:
  bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '30' minute) / 3600) as bigint)
  ,cast(truncate(to_unixtime(current_timestamp) / 3600) as bigint) ) and (ts >= current_timestamp - interval '30' minute);;
}
explore: hits_per_second_emr {
  sql_always_where: bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '60' second) / 60) as bigint)
      , cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
      and (ts >= current_timestamp - interval '60' second)
      ;;
}
explore: events_emr {
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  AND (ts >= current_timestamp - interval '20' second)
  ;;
  join: events_derive {
    sql_on: ${events_emr.ts_raw}=${events_derive.ts_raw} ;;
    relationship: many_to_one
  }
}
# explore: licensees {}
# explore: user_activity_derive {}
# explore: events_derive {}
# explore: products {}
# explore: countries {}
