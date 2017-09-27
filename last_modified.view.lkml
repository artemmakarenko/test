view: last_modified {
  sql_table_name: cassandra.playtech_dwh.last_modified ;;
  suggestions: no

  dimension: bucket_derive {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension_group: ts_derive {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      raw
    ]
    sql: ${TABLE}.ts ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [table_name]
#   }
}
