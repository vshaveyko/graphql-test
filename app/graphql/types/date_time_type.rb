DateTimeType = GraphQL::ScalarType.define do

  name "DateTime"
  description "Date with Time object in iso8601 format"

  coerce_input ->(value, ctx) { DateTime.parse(value) }
  coerce_result ->(value, ctx) { value.iso8601 }

end
