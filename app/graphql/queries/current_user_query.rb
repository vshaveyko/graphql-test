# :nodoc:
class CurrentUserQuery < GraphQL::Function

  description 'Currently logged in user'

  def self.call(obj, args, ctx)
    GraphQL::QueryResolver.run(User, ctx, User::Type) do
      ctx[:current_user]
    end
  end

end
