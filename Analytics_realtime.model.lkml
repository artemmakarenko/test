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
  sql_always_where:
  bucket = cast(truncate(to_unixtime(current_timestamp - interval '10' second) / 60) as bigint) and (ts >= current_timestamp - interval '10' second)
  ;;
}
explore: hits_per_minute {
  sql_always_where:
  bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '30' minute) / 3600) as bigint)
  ,cast(truncate(to_unixtime(current_timestamp) / 3600) as bigint) ) and (ts >= current_timestamp - interval '30' minute);;
}
explore: hits_per_second {
  sql_always_where: bucket IN (cast(truncate(to_unixtime(current_timestamp - interval '60' second) / 60) as bigint)
, cast(truncate(to_unixtime(current_timestamp) / 60) as bigint))
and (ts >= current_timestamp - interval '60' second)
  ;;
}
explore: events {
  sql_always_where:
  bucket = cast(truncate(to_unixtime(current_timestamp - interval '10' second) / 60) as bigint)
  AND (ts >= current_timestamp - interval '10' second)
  ;;
}

explore: licensees {
  # join: products {
  #   sql_on: ${licensees.product} = ${products.product} ;;
  # }
}
explore: user_activity_derive {}
explore: products {}

explore: user_activity_demo {}
explore: hits_per_minute_demo {}
explore: hits_per_second_demo {}
explore: events_demo {}
