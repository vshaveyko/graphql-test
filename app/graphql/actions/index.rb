module Actions::Index

  def initialize(getter)
    @getter = getter
  end

  def call(obj, args, ctx)
    if obj
      if @getter
        relation = obj.public_send(@getter)

        _apply_args_scopes(relation, args)
      else
        raise ArgumentError, "Requested #{model} from #{obj}, but no getter specified."
      end
    else
      GraphQL::QueryResolver.run(model, ctx, type.of_type) do
        _apply_args_scopes(model.all, args)
      end
    end
  end

  private

  def _apply_args_scopes(relation, args)
    reduce(relation, args) do |relation, (scope, params)|
      relation.public_send(scope, *params)
    end
  end

  def reduce(relation, args, &block)
    args.to_h.reduce(relation, &block)
  end

end
