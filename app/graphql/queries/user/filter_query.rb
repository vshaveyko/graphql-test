# :nodoc:
class User::FilterQuery < GraphqlServiceObject[:Filter]

  type types[User::Type]

  deprecation_reason "Because"

  argument :name, types.String, "Filter by name", as: :by_name
  argument :id,   types.ID,     "Filter by id"

end
