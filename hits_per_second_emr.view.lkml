view: hits_per_second_emr {
  sql_table_name: cassandra.bit_emr.hits_per_second ;;
  suggestions: no

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

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
    timeframes: [time, date,hour,minute, second, week, month]
    sql: ${TABLE}.ts ;;
  }

  measure: sum {
    type: sum
    sql:  ${TABLE}.hits ;;
    drill_fields: [user_details*]
  }
  set: user_details {
    fields: [licensee,brand,product,platform, amount_of_events ]
  }

}
