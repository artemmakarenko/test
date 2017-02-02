view: countries {
  sql_table_name: cassandra.bit.countries ;;
  suggestions: no

  dimension: capital {
    type: string
    sql: ${TABLE}.capital ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude
    ;;
    sql_longitude: ${TABLE}.longitude
    ;;
    }

#   measure: count {
#     type: count
#     drill_fields: [name]
#   }
}
