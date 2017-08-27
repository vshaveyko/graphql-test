Query = GraphQL::ObjectType.define do

  name "Query"

  # user #
  field :users       , types[User::Type] , function: User::FilterQuery
  field :currentUser ,       User::Type  , function: CurrentUserQuery

end

