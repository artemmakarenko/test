view: user_activity {
  sql_table_name: cassandra.bit.user_activity ;;
  suggestions: no

  dimension: active_users {
    type: number
    sql: ${TABLE}.active_users ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: lang {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.lang='NULL' THEN 'Unknown'
      ELSE ${TABLE}.lang
    END
    ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}.mode ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: product {
    type: string
    sql: lower(${TABLE}.product) ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, date, week, month, hour, minute, second, raw]
    sql: ${TABLE}.ts ;;
  }

  measure: sum_of_active_users {
    type: sum
    sql:  ${TABLE}.active_users ;;
  #  drill_fields: [licensee,brand,product,platform,active_users]
  }

  set: user_details {
    fields: [licensee,brand,product,platform]
  }

  dimension: country_code {
  sql:
  CASE
    WHEN ${TABLE}.country = 'Bulgaria' then 'BGR'
    when ${TABLE}.country = 'Canada' then 'CAN'
    when ${TABLE}.country = 'Estonia' then 'EST'
    when ${TABLE}.country = 'France' then 'FRA'
    when ${TABLE}.country = 'Germany' then 'DEU'
    when ${TABLE}.country = 'Greece' then 'GRC'
    when ${TABLE}.country = 'Italy' then 'ITA'
    when ${TABLE}.country = 'Latvia' then 'LVA'
    when ${TABLE}.country = 'Malta' then 'MLT'
    when ${TABLE}.country = 'Poland' then 'POL'
    when ${TABLE}.country = 'Portugal' then 'PRT'
    when ${TABLE}.country = 'Romania' then 'ROU'
    when ${TABLE}.country = 'Russia' then 'RUS'
    when ${TABLE}.country = 'Slovakia' then 'SVK'
    when ${TABLE}.country = 'Slovenia' then 'SVN'
    when ${TABLE}.country = 'Spain' then 'ESP'
    when ${TABLE}.country = 'Turkey' then 'TUR'
    when ${TABLE}.country = 'Ukraine' then 'UKR'
    ELSE 'Oth'
  END
  ;;
  }

  dimension: location {
    type: location
    sql_latitude:
      CASE
        WHEN ${TABLE}.country = 'Bulgaria' then '42.733883'
        when ${TABLE}.country = 'Ukraine' then '48.379433'
        WHEN ${TABLE}.country = 'Estonia' then '58.595272'
        when ${TABLE}.country = 'Latvia' then '56.879635'
        when ${TABLE}.country = 'Philippines' then '12.879721'
        when ${TABLE}.country = 'United States' then '37.090240'
        when ${TABLE}.country = 'Germany' then '51.165691'
        when ${TABLE}.country = 'Romania' then '45.943161'
        when ${TABLE}.country = 'Russia' then '61.524010'
        ELSE '56.828782'
      END;;
    sql_longitude:
      CASE
        WHEN ${TABLE}.country = 'Bulgaria' then '25.485830'
        when ${TABLE}.country = 'Ukraine' then '31.165580'
        WHEN ${TABLE}.country = 'Estonia' then '25.013607'
        when ${TABLE}.country = 'Latvia' then '24.603189'
        when ${TABLE}.country = 'Philippines' then '121.774017'
        when ${TABLE}.country = 'United States' then '-95.712891'
        when ${TABLE}.country = 'Germany' then '10.451526'
        when ${TABLE}.country = 'Romania' then '24.966760'
        when ${TABLE}.country = 'Russia' then '105.318756'
        ELSE '60.599269'
      END
      ;;
  }
}
