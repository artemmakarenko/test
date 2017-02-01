view: user_activity {
  sql_table_name: cassandra.bit.user_activity ;;
  suggestions: no

  dimension: active_users {
    type: number
    sql: ${TABLE}.active_users ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: lang {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.lang='NULL' THEN 'Unknown'
      ELSE ${TABLE}.lang
    END
    ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}.mode ;;
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

  measure: sum_of_active_users {
    type: sum
    sql:  ${TABLE}.active_users ;;
  #  drill_fields: [licensee,brand,product,platform,active_users]
  }

  set: user_details {
    fields: [licensee,brand,product,platform]
  }

}
