view: licensees {
  sql_table_name: cassandra.bit.licensees ;;
  suggestions: no

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: is_ims_active {
    type: number
    sql: ${TABLE}.is_ims_active ;;
  }


  dimension: launch_date_id {
    type: string
    sql: ${TABLE}.launch_date_id ;;
  }

  dimension: licensee_name {
    type: string
    sql: ${TABLE}.licensee_name ;;
  }

  dimension: licensee_type {
    type: string
    sql: ${TABLE}.licensee_type ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: site_id {
    type: number
    sql: ${TABLE}.site_id ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: licensee_name2 {
    type: string
    sql: ${TABLE}.licensee_name ;;
    suggest_dimension: licensees.licensee_name;;
  }

  # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#       internal_reporting_name,
#       licensee_name,
#       poker_network_name,
#       billing_name,
#       brand_name,
#       company_name
#     ]
  }
