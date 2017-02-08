view: hits_per_minute_emr {
  sql_table_name: cassandra.bit_emr.hits_per_minute ;;
  suggestions: no

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: amount_of_events {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
  }

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: product {
    type: string
    sql: lower(${TABLE}.product) ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, date, week, month, minute, hour, second]
    sql: ${TABLE}.ts ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum {
    type: sum
    sql:  ${TABLE}.hits ;;
    drill_fields: [user_details*]
  }
  set: user_details {
    fields: [licensee,brand,product,platform, amount_of_events]
  }
}
