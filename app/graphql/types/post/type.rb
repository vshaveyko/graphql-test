Post::Type = GraphQL::ObjectType.define do

  name "Post"

  field :id    , types.ID
  field :title , types.String
  field :body  , types.String

  field :comments , function: Comment::FilterQuery[:comments]
  field :user     , -> { User::Type }

end
