view: user_activity_derive_tst {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT max(ts) as max_ts
      FROM cassandra.bit.user_activity
      where (ts >= current_timestamp - interval '20' second)
      AND bucket IN (cast(floor(to_unixtime(current_timestamp - interval '20' second) / 60) as bigint)
      , cast(floor(to_unixtime(current_timestamp) / 60) as bigint))
      ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, date, week, month, hour, minute, second, raw]
    sql: ${TABLE}.max_ts ;;
  }

}
