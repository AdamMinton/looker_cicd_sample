view: order_items {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.order_items` ;;

  dimension: id {
    description: "Unique identifier for each order item."
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    description: "The date and time when the order item was created."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    description: "The date and time when the order item was delivered."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_id {
    description: "Identifier linking to the inventory item."
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    description: "Identifier for the associated order."
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    description: "Identifier for the associated product."
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: returned {
    description: "The date and time when the order item was returned."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    description: "The selling price of the item."
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension_group: shipped {
    description: "The date and time when the order item was shipped."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    description: "The current fulfillment status of the order item."
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    description: "Identifier for the customer who placed the order."
    type: number
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    description: "Total items ordered"
    type: count
    drill_fields: [id]
  }
  measure: total_sales {
    description: "Total sales of items"
    type: sum
    sql: ${sale_price} ;;
  }
  measure: total_orders {
    description: "Total Orders"
    type: count_distinct
    sql: ${order_id} ;;
  }
}
