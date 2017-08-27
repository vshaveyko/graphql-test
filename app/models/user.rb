class User < ActiveRecord::Base

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  scope :id, proc { |id = nil| where(id: id) }
  scope :by_name, ->(name) { where(name: name) }

end
