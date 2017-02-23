view: countries_tst {
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

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude
      ;;
    sql_longitude: ${TABLE}.longitude
      ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

}
