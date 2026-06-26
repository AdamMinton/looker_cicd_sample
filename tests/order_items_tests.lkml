# Data tests for order_items explore
test: order_items_count_greater_than_zero {
  explore_source: order_items {
    column: count {
      field: order_items.count
    }
  }
  assert: count_is_positive {
    expression: ${order_items.count} > 0 ;;
  }
}
