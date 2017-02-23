view: user_activity2 {
  sql_table_name: cassandra.bit.user_activity ;;
  suggestions: yes

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
    sql: ${TABLE}.lang
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
    sql: lower(${TABLE}.product) ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude
      ;;
    sql_longitude: ${TABLE}.longitude
      ;;
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

  # dimension: country_code {
  # sql:
  # CASE
  #   WHEN ${TABLE}.country = 'Bulgaria' then 'BGR'
  #   when ${TABLE}.country = 'Canada' then 'CAN'
  #   when ${TABLE}.country = 'Ukraine' then 'UKR'
  #   ELSE 'Oth'
  # END
  # ;;
  # }

  # dimension: location {
  #   type: location
  #   sql_latitude:
  #     CASE
  #       WHEN ${TABLE}.country = 'Bulgaria' then '42.733883'
  #       when ${TABLE}.country = 'Ukraine' then '48.379433'
  #       ELSE '56.828782'
  #     END;;
  #   sql_longitude:
  #     CASE
  #       WHEN ${TABLE}.country = 'Bulgaria' then '25.485830'
  #       when ${TABLE}.country = 'Ukraine' then '31.165580'
  #       ELSE '60.599269'
  #     END
  #     ;;
  # }
}
