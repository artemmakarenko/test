view: user_journey {
  sql_table_name: cassandra.test_user_journey.user_journey ;;
  suggestions: no

  # dimension: count_row {
  #   type: count
  #   sql: ${TABLE}.count ;;
  # }

  dimension: cur_event {
    type: string
    sql: ${TABLE}.cur_event ;;
    drill_fields: [lable,category]
  }

  dimension: next_event {
    type: string
    sql: ${TABLE}.next_event ;;
    drill_fields: [lable,category]
  }

  #   dimension: concat {
  #   type: string
  #   sql: concat(${TABLE}."cur_event",' ',${TABLE}."next_event")
  #   ;;
  # }

  measure: sum_users {
    type: sum
    sql: ${TABLE}.count ;;
    drill_fields: [lable,category]
  }

  dimension: lable {
    type: string
    sql:
    CASE
    WHEN ${TABLE}.cur_event like 'S%' then 'BGR'
    when ${TABLE}.cur_event like 'B%' then 'CAN'
    when ${TABLE}.cur_event like 'D%' then 'UKR'
    ELSE 'Oth'
    END
  ;;
  }

  dimension: category {
    type: string
    sql:
      CASE
        WHEN ${TABLE}.cur_event like 'S%' then 'aaa'
        when ${TABLE}.cur_event like 'B%' then 'bbb'
        when ${TABLE}.cur_event like 'D%' then 'ccc'
        ELSE 'ddd'
      END
      ;;
  }
}
