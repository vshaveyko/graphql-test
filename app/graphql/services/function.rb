module Function

  module_function

  def Create(model:, input_types:)
    Class.new(GraphQL::Function) do

      input_types.each do |input_type|
        input_type.arguments.each do |name, argument|
          own_arguments[name] = argument
        end
      end

      description "Create a #{model}"

      extend Actions::Create

    end
  end

  def Update(model:, input_types:)
    Class.new(GraphQL::Function) do

      input_types.each do |input_type|
        input_type.arguments.each do |name, argument|
          own_arguments[name] = argument
        end
      end

      description "Update a #{model} by ID"

      extend Actions::Update

    end
  end

  def Destroy(model:)
    Class.new(GraphQL::Function) do
      description "Destroy a #{model} by ID"

      extend Actions::Destroy
    end
  end

end
