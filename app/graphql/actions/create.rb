module Actions::Create

  def call(_obj, inputs, ctx)
    model.create!(inputs.to_h)
  end

end
