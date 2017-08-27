# :nodoc:
module Actions

  module Default

    module_function

    def extended(base)
      if action = Actions.action(base.action_name)
        base.extend action
      end
    end

  end

  ACTION_MAP = {
    'Create'  => Create,
    'Update'  => Update,
    'Destroy' => Destroy,
    'Index'   => Index
  }.freeze

  module_function

  def action(action_name)
    ACTION_MAP[action_name]
  end

end
