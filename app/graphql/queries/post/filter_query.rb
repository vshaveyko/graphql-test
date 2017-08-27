# :nodoc:
class Post::FilterQuery < GraphqlServiceObject[:Filter]

  type types[Post::Type]

  argument :body, types.String, "Filter by body contains"
  argument :id,    types.ID,     "Filter by id"

end
