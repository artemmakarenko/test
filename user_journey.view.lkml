view: user_journey {
  sql_table_name: cassandra.test_user_journey.user_journey ;;
  suggestions: no

  # dimension: count {
  #   type: number
  #   sql: ${TABLE}."count" ;;
  # }

  dimension: cur_event {
    type: string
    sql: ${TABLE}.cur_event ;;
  }

  dimension: next_event {
    type: string
    sql: ${TABLE}.next_event ;;
  }

    dimension: concat {
    type: string
    sql: concat(${TABLE}."cur_event",' ',${TABLE}."next_event")
    ;;
  }

  measure: sum_users {
    type: sum
    sql: ${TABLE}.count ;;
  }
}
