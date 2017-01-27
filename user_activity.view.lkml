view: user_activity {
  sql_table_name: cassandra.bit.user_activity ;;
  suggestions: yes

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
    timeframes: [time, date, week, month, hour, minute, second, raw]
    sql: ${TABLE}.ts ;;
  }

  measure: max {
    type: max
    sql:  ${TABLE}.ts ;;
  }

  measure: sum_of_active_users {
    type: sum
    sql:  ${TABLE}.active_users ;;
    # link: {
    #   label: "Deatail"
    #   url: "https://54.154.184.108/looks/101"
    #   icon_url: "http://looker.com/favicon.ico"
    # }
    drill_fields: [licensee,brand,product,platform,active_users]
  }

  set: user_details {
    fields: [licensee,brand,product,platform]
  }

}
