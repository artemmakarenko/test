view: events {
  sql_table_name: cassandra.bit.events ;;
  suggestions: no

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
    drill_fields:  [category, label]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
 #   drill_fields:  [category, action, label]
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    drill_fields:  [ action, label]
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
    drill_fields:  [category, action]
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
 #   drill_fields:  [category, action, label]
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  #  drill_fields:  [category, action, label]
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, hour, minute,second, date, week, month]
    sql: ${TABLE}.ts ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
  measure: sum {
    type: sum
    sql: coalesce(${TABLE}.hits,0) ;;
  }

#   measure: percent_of_total_hits {
#     type: percent_of_total
#     sql: ${sum} ;;
#   }

  # dimension: product_filter {
  #   sql: ${TABLE}.product ;;
  #   suggestions: ["casino","IMS"]

  # }
  measure: percent_of_total_hits {
    type: percent_of_total
    sql: ${sum};;
   }

}
