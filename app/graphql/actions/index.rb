
module Actions::Index

  def call(obj, args, ctx)
    reduce(args) do |relation, (scope, params)|
      relation.public_send(scope, *params)
    end
  end

  private

  def reduce(args, &block)
    args.to_h.reduce(model.all, &block)
  end

end
