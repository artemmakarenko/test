view: countries {
  sql_table_name: cassandra.playtech_dwh.countries ;;
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

  dimension: iso {
    type: string
    sql:
    case
        when ${TABLE}.name='Estonia' then 'EST'
        when ${TABLE}.name='Gibraltar' then 'GIB'
        when ${TABLE}.name='Ukraine' then 'UKR'
        when ${TABLE}.name='Philippines' then 'PHL'
        when ${TABLE}.name='United States' then 'USA'
    end
      ;;
  }
}
