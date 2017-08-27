module Function

  module_function

  def Create(model:, input_types:)
    klass = GraphqlServiceObject[:Create]
    klass.model = model
    klass.input_types = input_types
    klass.description "Create a #{model}"
    klass
  end

  def Update(model:, input_types:)
    klass = GraphqlServiceObject[:Update]
    klass.model = model
    klass.input_types = input_types
    klass
  end

  def Destroy(model:)
    klass = GraphqlServiceObject[:Destroy]
    klass.model = model
    klass
  end

end
