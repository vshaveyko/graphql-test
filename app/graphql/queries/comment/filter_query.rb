class Comment::FilterQuery < GraphqlServiceObject[:Filter]

  type types[Comment::Type]

  argument :body, types.String, "Filter by body contains"
  argument :id,    types.ID,     "Filter by id"

end
