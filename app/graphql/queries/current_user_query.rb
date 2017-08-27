# :nodoc:
class CurrentUserQuery < GraphQL::Function

  description 'Currently logged in user'

  def self.call(obj, args, ctx)
    ctx[:current_user]
  end

end
