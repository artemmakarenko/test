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
  # access_filter_fields: [user_activity.product]
  persist_for: "20 seconds"
#   sql_always_where:
#   user_activity.bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
#   cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
#   and (user_activity.ts >= current_timestamp - interval '20' second);;
#   join: last_modified {
#     sql_on: ${user_activity.ts_raw}=${last_modified.ts_derive_raw}
#     and last_modified.table_name='user_activity';;
#     type: inner
#     relationship: many_to_one
#   }
# }
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  and (ts >= current_timestamp - interval '20' second);;
  join: user_activity_derive {
    sql_on: ${user_activity.ts_raw}=${user_activity_derive.ts_raw} ;;
    type: inner
    relationship: many_to_one
    }
  }
  # sql_always_where:
  # bucket = (select bucket from  cassandra.bit.last_modified) -- where table_name='user_activity'
  # and ts = (select ts from  cassandra.bit.last_modified ) -- where table_name='user_activity'
  # ;;
#
#   bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
#   cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
#   and (ts >= current_timestamp - interval '20' second);;
#   join: user_activity_derive {
#     sql_on: ${user_activity.ts_raw}=${user_activity_derive.ts_raw} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
  # join: countries {
  #   sql_on: lower(${user_activity.country})=lower(${countries.name}) ;;
  #   relationship: many_to_one
  # }
#}
explore: hits_per_minute {
  label: "(2) Hits per minute"
  # access_filter_fields: [hits_per_minute.product]
  # persist_for: "5 seconds"
  sql_always_where:
  bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '31' minute) / 3600) as bigint)
  ,cast(truncate(to_unixtime(current_timestamp) / 3600) as bigint) ) and (ts >= current_timestamp - interval '31' minute);;
}
explore: hits_per_second {
  label: "(3) Hits per second"
  # access_filter_fields: [hits_per_second.product]
  persist_for: "20 seconds"
  sql_always_where: bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '60' second) / 60) as bigint)
  , cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  and (ts >= current_timestamp - interval '60' second)
  ;;
}
explore: events {
  label: "(4) Events"
  # access_filter_fields: [events.product]
  persist_for: "20 seconds"
  sql_always_where:
  bucket in (cast(truncate(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint),
  cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
  AND (ts >= current_timestamp - interval '20' second)
  ;;
  join: events_derive {
    sql_on: ${events.ts_raw}=${events_derive.ts_raw} ;;
    type: inner
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
# explore: countries {}

# explore: user_activity_demo {}
# explore: hits_per_minute_demo {}
# explore: hits_per_second_demo {}
# explore: events_demo {
#   always_filter: {
#     filters: {
#       field: ts_hour
#       value: "2017-01-01 00"
#     }

#   conditionally_filter: {
#     filters: {
#       field: ts_date
#       value: "2017-01-01"
#     }
#     unless: [ts_second]
#   }
#   }
# }

explore: hr_looker_training_set {}
explore: user_journey {}

explore: last_modified {}

explore: user_activity2 {
  sql_always_where:
  user_activity2.bucket in (select bucket from  cassandra.playtech_dwh.last_modified where table_name='user_activity')
  and user_activity2.ts in (select ts from  cassandra.playtech_dwh.last_modified where table_name='user_activity')
    ;;
#   join: last_modified {
#     sql_on: ${user_activity2.ts_raw}=${last_modified.ts_derive_raw} ;;
#     type: inner
#     relationship: many_to_one
#   }
  # join: countries {
  #   sql_on: lower(${user_activity.country})=lower(${countries.name}) ;;
  #   relationship: many_to_one
  # }
}
