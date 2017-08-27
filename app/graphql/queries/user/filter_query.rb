# :nodoc:
class User::FilterQuery < GraphqlServiceObject

  argument :name, types.String, "Filter by name", as: :by_name
  argument :id,   types.ID,     "Filter by id"

end
