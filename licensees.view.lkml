view: licensees {
  sql_table_name: cassandra.bit.licensees ;;
  suggestions: no

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: advertiser_url {
    type: string
    sql: ${TABLE}.advertiser_url ;;
  }

  dimension: banned_signup_countries {
    type: string
    sql: ${TABLE}.banned_signup_countries ;;
  }

  dimension: banner_admin_url {
    type: string
    sql: ${TABLE}.banner_admin_url ;;
  }

  dimension: banner_site_url {
    type: string
    sql: ${TABLE}.banner_site_url ;;
  }

  dimension: benchmark {
    type: string
    sql: ${TABLE}.benchmark ;;
  }

  dimension: billing_name {
    type: string
    sql: ${TABLE}.billing_name ;;
  }

  dimension: bingo_benchamrk {
    type: string
    sql: ${TABLE}.bingo_benchamrk ;;
  }

  dimension: bingo_game_site {
    type: string
    sql: ${TABLE}.bingo_game_site ;;
  }

  dimension: bingo_source_id {
    type: number
    sql: ${TABLE}.bingo_source_id ;;
  }

  dimension: bingo_src_sys_id {
    type: string
    sql: ${TABLE}.bingo_src_sys_id ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: brand_type {
    type: string
    sql: ${TABLE}.brand_type ;;
  }

  dimension: bs_login_disabled {
    type: number
    sql: ${TABLE}.bs_login_disabled ;;
  }

  dimension: bs_update_date {
    type: string
    sql: ${TABLE}.bs_update_date ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: default_language_id {
    type: string
    sql: ${TABLE}.default_language_id ;;
  }

  dimension: default_signup_country {
    type: string
    sql: ${TABLE}.default_signup_country ;;
  }

  dimension: disable_held_funds {
    type: number
    sql: ${TABLE}.disable_held_funds ;;
  }

  dimension: download_url {
    type: string
    sql: ${TABLE}.download_url ;;
  }

  dimension: dwh_creation_date {
    type: string
    sql: ${TABLE}.dwh_creation_date ;;
  }

  dimension: dwh_update_date {
    type: string
    sql: ${TABLE}.dwh_update_date ;;
  }

  dimension: has_side_games {
    type: number
    sql: ${TABLE}.has_side_games ;;
  }

  dimension: home_page_url {
    type: string
    sql: ${TABLE}.home_page_url ;;
  }

  dimension: internal_reporting_name {
    type: string
    sql: ${TABLE}.internal_reporting_name ;;
  }

  dimension: is_bingo {
    type: number
    sql: ${TABLE}.is_bingo ;;
  }

  dimension: is_casino {
    type: number
    sql: ${TABLE}.is_casino ;;
  }

  dimension: is_casino_churn {
    type: number
    sql: ${TABLE}.is_casino_churn ;;
  }

  dimension: is_casino_ltv {
    type: number
    sql: ${TABLE}.is_casino_ltv ;;
  }

  dimension: is_casino_segmentation {
    type: number
    sql: ${TABLE}.is_casino_segmentation ;;
  }

  dimension: is_deposit {
    type: number
    sql: ${TABLE}.is_deposit ;;
  }

  dimension: is_deposit_button {
    type: number
    sql: ${TABLE}.is_deposit_button ;;
  }

  dimension: is_game_adv_vol {
    type: number
    sql: ${TABLE}.is_game_adv_vol ;;
  }

  dimension: is_game_preference {
    type: number
    sql: ${TABLE}.is_game_preference ;;
  }

  dimension: is_gts {
    type: number
    sql: ${TABLE}.is_gts ;;
  }

  dimension: is_ims_active {
    type: number
    sql: ${TABLE}.is_ims_active ;;
  }

  dimension: is_integrated {
    type: number
    sql: ${TABLE}.is_integrated ;;
  }

  dimension: is_lb {
    type: number
    sql: ${TABLE}.is_lb ;;
  }

  dimension: is_live {
    type: number
    sql: ${TABLE}.is_live ;;
  }

  dimension: is_managed {
    type: number
    sql: ${TABLE}.is_managed ;;
  }

  dimension: is_mobile {
    type: number
    sql: ${TABLE}.is_mobile ;;
  }

  dimension: is_poker {
    type: number
    sql: ${TABLE}.is_poker ;;
  }

  dimension: is_poker_churn {
    type: number
    sql: ${TABLE}.is_poker_churn ;;
  }

  dimension: is_poker_ltv {
    type: number
    sql: ${TABLE}.is_poker_ltv ;;
  }

  dimension: is_poker_segmentation {
    type: number
    sql: ${TABLE}.is_poker_segmentation ;;
  }

  dimension: is_portal {
    type: number
    sql: ${TABLE}.is_portal ;;
  }

  dimension: is_product_preference {
    type: number
    sql: ${TABLE}.is_product_preference ;;
  }

  dimension: is_sport_churn {
    type: number
    sql: ${TABLE}.is_sport_churn ;;
  }

  dimension: is_sport_ltv {
    type: number
    sql: ${TABLE}.is_sport_ltv ;;
  }

  dimension: is_sport_segmentation {
    type: number
    sql: ${TABLE}.is_sport_segmentation ;;
  }

  dimension: is_sportbook {
    type: number
    sql: ${TABLE}.is_sportbook ;;
  }

  dimension: is_terminated {
    type: number
    sql: ${TABLE}.is_terminated ;;
  }

  dimension: is_tv {
    type: number
    sql: ${TABLE}.is_tv ;;
  }

  dimension: italian_regulation {
    type: number
    sql: ${TABLE}.italian_regulation ;;
  }

  dimension: jackpot_balance {
    type: number
    sql: ${TABLE}.jackpot_balance ;;
  }

  dimension: launch_date_id {
    type: string
    sql: ${TABLE}.launch_date_id ;;
  }

  dimension: legal_entity_description {
    type: string
    sql: ${TABLE}.legal_entity_description ;;
  }

  dimension: legal_jurisdiction {
    type: string
    sql: ${TABLE}.legal_jurisdiction ;;
  }

  dimension: licensee_name {
    type: string
    sql: ${TABLE}.licensee_name ;;
  }

  dimension: licensee_type {
    type: string
    sql: ${TABLE}.licensee_type ;;
  }

  dimension: manage_adv_payments {
    type: number
    sql: ${TABLE}.manage_adv_payments ;;
  }

  dimension: migration_date {
    type: string
    sql: ${TABLE}.migration_date ;;
  }

  dimension: money_transfer_poker {
    type: number
    sql: ${TABLE}.money_transfer_poker ;;
  }

  dimension: poker_network_benchmark {
    type: string
    sql: ${TABLE}.poker_network_benchmark ;;
  }

  dimension: poker_network_name {
    type: string
    sql: ${TABLE}.poker_network_name ;;
  }

  dimension: poker_source_id {
    type: number
    sql: ${TABLE}.poker_source_id ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: record_id {
    type: string
    sql: ${TABLE}.record_id ;;
  }

  dimension: record_update_date {
    type: string
    sql: ${TABLE}.record_update_date ;;
  }

  dimension: registered_wallet_code {
    type: number
    sql: ${TABLE}.registered_wallet_code ;;
  }

  dimension: regulation {
    type: string
    sql: ${TABLE}.regulation ;;
  }

  dimension: restrict_online_cashier {
    type: number
    sql: ${TABLE}.restrict_online_cashier ;;
  }

  dimension: ri_ind {
    type: number
    sql: ${TABLE}.ri_ind ;;
  }

  dimension: ri_source_table {
    type: string
    sql: ${TABLE}.ri_source_table ;;
  }

  dimension: site_id {
    type: number
    sql: ${TABLE}.site_id ;;
  }

  dimension: sport_source_id {
    type: number
    sql: ${TABLE}.sport_source_id ;;
  }

  dimension: withdraw_verification_enabled {
    type: number
    sql: ${TABLE}.withdraw_verification_enabled ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      internal_reporting_name,
      licensee_name,
      poker_network_name,
      billing_name,
      brand_name,
      company_name
    ]
  }
}
