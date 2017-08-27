# :nodoc:
class GraphqlServiceObject < GraphQL::Function

  class << self

    attr_accessor :model, :action_name, :type_name

    def inherited(base)
      model_name, base.action_name = base.name.split('::')
      base.model = model_name.constantize

      base.extend Actions::Default
    end

    def input_type(*input_types)
      input_types.each do |input_type|
        input_type.arguments.each do |name, argument|
          own_arguments[name] = argument
        end
      end
    end

  end

end
