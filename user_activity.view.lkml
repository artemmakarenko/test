view: user_activity {
  sql_table_name: cassandra.bit.user_activity ;;
  suggestions: no

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: active_users {
    type: number
    sql: ${TABLE}.active_users ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
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
    sql: ${TABLE}.product ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, date, week, month, hour, minute, second]
    sql: ${TABLE}.ts ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum {
    type: sum
    sql:  coalesce(${TABLE}.active_users,0) ;;
    drill_fields: [user_details*]
  }

  set: user_details {
    fields: [platform, sum]
  }

  dimension: custom_min {
    type: string
    sql: ${TABLE}.DATE_FORMAT(ts,'%i') ;;
  }
}
