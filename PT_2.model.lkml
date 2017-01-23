# connection: "presto_dev_env"
connection: "presto_db_connection_stg"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     sql_on: ${orders.id} = ${order_items.order_id}
#   }
#
#   join: users {
#     sql_on: ${users.id} = ${orders.user_id}
#   }
# }

explore: user_activity {
  sql_always_where: bucket = cast(floor(to_unixtime(current_timestamp) / 60) as bigint);;
}
explore: hits_per_minute {
  sql_always_where: bucket IN (
  cast(floor(to_unixtime(current_timestamp - interval '30' minute) / 3600) as bigint)
 ,cast(floor(to_unixtime(current_timestamp)/3600 ) as bigint)
  );;
}
explore: hits_per_second {
  sql_always_where: bucket IN (cast(floor(to_unixtime(current_timestamp - interval '59' second) / 60) as bigint)
, cast(floor(to_unixtime(current_timestamp) / 60) as bigint))
  ;;
}
explore: events {
  sql_always_where: bucket = cast(floor(to_unixtime(current_timestamp) / 60) as bigint);;
}

explore: licensees {}
explore: products {}

explore: user_activity_demo {
  sql_always_where: bucket = 24746400 ;;
}
explore: hits_per_minute_demo {
  sql_always_where: bucket >= 412381;;
  }
explore: hits_per_second_demo {
  sql_always_where: bucket = 24747383;;
}
explore: events_demo {
  sql_always_where: bucket >= 24744998;;
}
