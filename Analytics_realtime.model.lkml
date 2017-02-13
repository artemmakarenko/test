# connection: "presto_dev_env"
connection: "presto_db_connection_stg"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: licensees {
#   join: orders {
#     sql_on: ${orders.id} = ${order_items.order_id}
#   }

#   join: users {
#     sql_on: ${users.id} = ${orders.user_id}
#   }

explore: user_activity {
  label: "(1) User activity"
  access_filter_fields: [user_activity.product]
  persist_for: "5 seconds"
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  and (ts >= current_timestamp - interval '20' second);;
  join: user_activity_derive {
    sql_on: ${user_activity.ts_raw}=${user_activity_derive.ts_raw} ;;
    relationship: many_to_one
  }
  join: countries {
    sql_on: lower(${user_activity.country})=lower(${countries.name}) ;;
    relationship: many_to_one
  }
}
explore: hits_per_minute {
  label: "(2) Hits per minute"
  access_filter_fields: [hits_per_minute.product]
  # persist_for: "5 seconds"
  sql_always_where:
  bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '30' minute) / 3600) as bigint)
  ,cast(truncate(to_unixtime(current_timestamp) / 3600) as bigint) ) and (ts >= current_timestamp - interval '30' minute);;
}
explore: hits_per_second {
  label: "(3) Hits per second"
  access_filter_fields: [hits_per_second.product]
  persist_for: "5 seconds"
  sql_always_where: bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '60' second) / 60) as bigint)
  , cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  and (ts >= current_timestamp - interval '60' second)
  ;;
}
explore: events {
  label: "(4) Events"
  access_filter_fields: [events.product]
  persist_for: "5 seconds"
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  AND (ts >= current_timestamp - interval '20' second)
  ;;
  join: events_derive {
    sql_on: ${events.ts_raw}=${events_derive.ts_raw} ;;
    relationship: many_to_one
  }
}

explore: licensees {
  join: user_activity {
    sql_on: lower(${licensees.licensee_name})=lower(${user_activity.licensee}) ;;
    relationship: one_to_one
  }
}

explore: user_activity_derive {}
explore: events_derive {}
explore: products {}
explore: countries {}

explore: user_activity_demo {}
explore: hits_per_minute_demo {}
explore: hits_per_second_demo {}

explore: test {}
