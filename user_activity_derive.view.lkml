view: user_activity_derive {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT max(ts) as max_ts
      FROM cassandra.bit.user_activity
      where (user_activity.ts ) >= DATE_ADD('second', -59, NOW())
      AND bucket IN (cast(floor(to_unixtime(current_timestamp - interval '59' second) / 60) as bigint)
      , cast(floor(to_unixtime(current_timestamp) / 60) as bigint))
      ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, date, week, month, hour, minute, second, raw]
    sql: ${TABLE}.max_ts ;;
  }

}
