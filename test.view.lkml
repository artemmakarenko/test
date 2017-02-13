view: test {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: cassandra.bit.licensees ;;

  derived_table: {
    sql: SELECT site_id, brand_id, count(*) as cnt
      FROM cassandra.bit.licensees
      where {% condition ims_flag %} licensees.is_ims_active {% endcondition %}
      group by site_id, brand_id
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: site_id {
    description: "Unique site ID"
    type: number
    sql: ${TABLE}.site_id ;;
  }

  dimension: brand_id {
    description: "Unique brand ID"
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.cnt ;;
  }

  filter: ims_flag {
    label: "FILTER is ims active or not"
    type: number
  }

}
