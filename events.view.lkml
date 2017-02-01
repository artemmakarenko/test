view: events {
  sql_table_name: cassandra.bit.events ;;
  suggestions: no

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action;;
    # CASE
    #   WHEN ${TABLE}.action='NULL' THEN 'Unknown'
    #   ELSE ${TABLE}.action
    # END
    # ;;
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

  dimension: amount_of_events {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
    # drill_fields:  [category, action, amount_of_events]
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
    timeframes: [time, hour, minute,second, date, week, month, raw]
    sql: ${TABLE}.ts ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
  measure: sum_of_events {
    type: sum
    sql: coalesce(${TABLE}.hits,0) ;;
    drill_fields: [user_details*]
  }

  set: user_details {
    fields: [category, action, label, amount_of_events ]
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
    sql: ${sum_of_events};;
   }

}
