Mutation = GraphQL::ObjectType.define do

  name 'Mutation'

  # user #
  user_input_types = [User::InputType]
  field :CreateUser  , User::Type      , function: Function.Create(model: User, input_types: user_input_types)
  field :UpdateUser  , User::Type      , function: Function.Update(model: User, input_types: user_input_types)
  field :DestroyUser , types.Boolean , function: Function.Destroy(model: User)

end
