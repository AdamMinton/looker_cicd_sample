# LAMS
# rule: dimensions_require_descriptions {
#   description: "All dimensions must have a description."
#   match: "$.file.*.view.*.dimension.*"
#   expr_rule: ( $if ( === ::match:description undefined ) "Missing description" ( $if ( $boolean ( $match "^\\s*$" ::match:description ) ) "Empty description" true ) ) ;;
# }
# rule: dimension_groups_require_descriptions {
#   description: "All dimension groups must have a description."
#   match: "$.file.*.view.*.dimension_group.*"
#   expr_rule: ( $if ( === ::match:description undefined ) "Missing description" ( $if ( $boolean ( $match "^\\s*$" ::match:description ) ) "Empty description" true ) ) ;;
# }
# rule: measures_require_descriptions {
#   description: "All measures must have a description."
#   match: "$.file.*.view.*.measure.*"
#   expr_rule: ( $if ( === ::match:description undefined ) "Missing description" ( $if ( $boolean ( $match "^\\s*$" ::match:description ) ) "Empty description" true ) ) ;;
# }


#small change
