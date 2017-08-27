# :nodoc:
Comment::Type = GraphQL::ObjectType.define do

  name "Comment"

  field :id  , types.ID
  field :body, types.String

  field :post, -> { Post::Type }
  field :user, -> { User::Type }

end
