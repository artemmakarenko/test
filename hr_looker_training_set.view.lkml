view: hr_looker_training_set {

  derived_table: {
    sql:
      select
      'Loaded' as action_source,
      'Click' as action_dist,
      'aa' as element,
      'label' as label,
      2 as users
      union all
      select
      'Click' as action_source,
      'Display' as action_dist,
      'aa' as element,
      'label' as label,
      2 as users
      union all
      select
      'Display' as action_source,
      'Close' as action_dist,
      'aa' as element,
      'label' as label,
      2 as users
       union all
      select
      'Close' as action_source,
      'Close999' as action_dist,
      'aa' as element,
      'label' as label,
      2 as users

      union all
       select
      'Loaded2' as action_source,
      'Click2' as action_dist,
      'aa3' as element,
      'label' as label,
      3 as users
      union all
      select
      'Click2' as action_source,
      'Display' as action_dist,
      'aa3' as element,
      'label' as label,
      3 as users
      union all
      select
      'Display' as action_source,
      'Close2' as action_dist,
      'aa3' as element,
      'label' as label,
      3 as users
            union all
      select
      'Close2' as action_source,
      'Close999' as action_dist,
      'aa3' as element,
      'label' as label,
      3 as users

      union all
      select
      'Loaded' as action_source,
      'Close999' as action_dist,
      'aa2' as element,
      'label' as label,
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
  dimension: element {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.element ;;
  }
  dimension: label {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: users_count {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.users ;;
    drill_fields: [user_details*]
  }

  set: user_details {
    fields: [element, label, users_count ]
  }
}
