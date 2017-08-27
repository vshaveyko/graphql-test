User::Type = GraphQL::ObjectType.define do

  name "User"

  field :id         , types.ID
  field :created_at , DateTimeType
  field :updated_at , DateTimeType
  field :name       , types.String
  field :email      , types.String

  field :comments      , function: Comment::FilterQuery[:comments] # , -> { types[Comment::Type] }
  field :post_comments , function: Comment::FilterQuery[:post_comments] # , -> { types[Comment::Type] }
  field :posts         , function: Post::FilterQuery[:posts] #, -> { types[Post::Type] }

end
