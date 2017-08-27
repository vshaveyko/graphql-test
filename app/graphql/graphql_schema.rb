GraphqlSchema = GraphQL::Schema.define do

  query Query
  mutation Mutation

  max_depth 9

end
