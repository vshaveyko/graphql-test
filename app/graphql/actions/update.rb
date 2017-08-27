module Actions::Update

  def self.extended(base)
    base.class_eval do
      argument :id, !types.ID
    end
  end

  def call(obj, inputs, ctx)
    obj = model.find(inputs[:id])
    # authorize...
    obj.update!(inputs.to_h)
    obj
  end

end
