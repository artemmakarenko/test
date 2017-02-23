# connection: "presto_dev_env"
connection: "presto_dev_11"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: user_activity_tst {
  #access_filter_fields: [user_activity.product]
  persist_for: "30 seconds"
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  and (ts >= current_timestamp - interval '20' second);;
  join: user_activity_derive_tst {
    sql_on: ${user_activity_tst.ts_raw}=${user_activity_derive_tst.ts_raw} ;;
    type: inner
    relationship: many_to_one
   }
  }
explore: hits_per_minute_tst {
  #access_filter_fields: [hits_per_minute.product]
  # persist_for: "5 seconds"
  sql_always_where:
  bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '30' minute) / 3600) as bigint)
  ,cast(truncate(to_unixtime(current_timestamp) / 3600) as bigint) ) and (ts >= current_timestamp - interval '30' minute);;
}
explore: hits_per_second_tst {
  # access_filter_fields: [hits_per_second.product]
  # persist_for: "30 seconds"
  sql_always_where: bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '60' second) / 60) as bigint)
      , cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
      and (ts >= current_timestamp - interval '60' second)
      ;;
}
explore: events_tst {
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  AND (ts >= current_timestamp - interval '20' second)
  ;;
  join: events_derive_tst {
    sql_on: ${events_tst.ts_raw}=${events_derive_tst.ts_raw} ;;
    type: inner
    relationship: many_to_one
  }
}
explore: user_activity_derive_tst {}
explore: events_derive_tst {}
# explore: countries_tst {}
