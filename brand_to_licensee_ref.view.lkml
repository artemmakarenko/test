view: brand_to_licensee_ref {
  sql_table_name: cassandra.rt_reports.brand_to_licensee_ref ;;
  suggestions: no

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
