view: hr_looker_training_set {

  derived_table: {
    sql:
      select
      'Loaded' as action_source,
      'Click' as action_dist,
      2 as users
      union all
      select
      'Loaded' as action_source,
      'Display' as action_dist,
      2 as users
      union all
      select
      'Display' as action_source,
      'Click' as action_dist,
      3 as users
      union all
      select
      'Display' as action_source,
      'Loaded' as action_dist,
      3 as users
      union all
      select
      'Loaded' as action_source,
      'Click order' as action_dist,
      3 as users
      union all
      select
      'Click order' as action_source,
      'Click' as action_dist,
      1 as users
      union all
      select
      'Click order' as action_source,
      'Loaded' as action_dist,
      4 as users
      ;;
  }
#   # Define your dimensions and measures here, like this:
  dimension: action_source {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.action_source ;;
  }

  dimension: action_dist {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.action_dist ;;
  }


  measure: users_count {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.users ;;
  }
}
