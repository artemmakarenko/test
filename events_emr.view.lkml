view: events_emr {
  sql_table_name: cassandra.bit_emr.events ;;
  suggestions: no

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action;;
    drill_fields:  [category, label]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    drill_fields:  [ action, label]
  }

  dimension: amount_of_events {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
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
    timeframes: [time, hour, minute,second, date, week, month, raw]
    sql: ${TABLE}.ts ;;
  }

  measure: sum_of_events {
    type: sum
    sql: coalesce(${TABLE}.hits,0) ;;
    drill_fields: [user_details*]
  }

  set: user_details {
    fields: [category, action, label, amount_of_events ]
  }
}
