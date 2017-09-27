view: products {
  sql_table_name: cassandra.playtech_dwh.products ;;
  suggestions: yes

  dimension: product {
    type: string
    full_suggestions: yes
    sql: ${TABLE}.product ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
