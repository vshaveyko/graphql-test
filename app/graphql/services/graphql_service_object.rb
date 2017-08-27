# :nodoc:
class GraphqlServiceObject < GraphQL::Function

  cattr_accessor :model, :action_name, :type_name

  # redefine in ur query if it needs one
  def initialize(*); end

  class << self

    def inherited(base)
      return unless base.name

      model_name, _ = base.name.split('::')

      base.class_eval do

        self.model = model_name.constantize

        def self.[](arg)
          new(arg)
        end

      end
    end

    def [](action_name)
      Class.new(self) do

        case action_name
        when :Filter
          include Actions::Index
          description 'Filter by query parameters'
        when :Update
          include Actions::Update
          description 'Update by ID'
        when :Create
          include Actions::Create
          description 'Create with given attributes'
        when :Destroy
          include Actions::Destroy
          description 'Destroy by ID'
        end

      end
    end

    def input_types=(input_types)
      input_types.each do |input_type|
        input_type.arguments.each do |name, argument|
          own_arguments[name] = argument
        end
      end
    end

    def call(*args)
      new(nil).call(*args)
    end

  end

end
