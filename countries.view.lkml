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

  dimension: name2 {
    type: string
    sql: ${TABLE}.name ;;
    html:
    <p style="font-size:300%">{{ rendered_value }}</p>
    ;;
  }
  dimension: name3 {
    type: string
    sql: ${TABLE}.name ;;
    html:
    <p style="font-family:courier">{{ rendered_value }}</p>
    ;;
  }
  dimension: name4 {
    type: string
    sql: ${TABLE}.name ;;
    html:
    <p style="text-align:center">{{ rendered_value }}</p>
    ;;
  }
  dimension: name5 {
    type: string
    sql: ${TABLE}.name ;;
    html:
    <p style="color: #900000">{{ rendered_value }}</p>
    ;;
  }
  dimension: name6 {
    type: string
    sql: ${TABLE}.name ;;
    html:
    <p style="color: white; background-color: #006600">{{ rendered_value }}</p>
    ;;
  }
}
