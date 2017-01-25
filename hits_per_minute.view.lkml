view: hits_per_minute {
  sql_table_name: cassandra.bit.hits_per_minute ;;
  suggestions: no

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
  }

  dimension: bucket {
    type: number
    sql: ${TABLE}."bucket" ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, date, week, month, minute, hour]
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
  fields: [licensee,brand,product,platform, sum ]
  }

  measure: percent_sum_growth {
    type: percent_of_previous
    sql: ${sum} ;;
  }

  measure: percent_of_total_sum {
    type: percent_of_total
    sql: ${sum} ;;
  }

  measure: cumulative_total_sum {
    type: running_total
    sql: ${sum} ;;
    value_format_name: usd
  }
}
