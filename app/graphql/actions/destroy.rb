module Actions::Destroy

  def self.extended(base)
    base.class_eval do
      argument :id, !types.ID
    end
  end

  def call(obj, args, ctx)
    model.destroy(args[:id])
  end

end
