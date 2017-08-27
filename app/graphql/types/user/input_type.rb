# :nodoc:
User::InputType = GraphQL::InputObjectType.define do

  name "UserInputType"
  description "Properties for creating/updating a User"

  input_field :email,    !types.String, "Email of the user."
  input_field :name,      types.String, "Name of the user."
  input_field :password,  types.String, "Password of the user"

end
