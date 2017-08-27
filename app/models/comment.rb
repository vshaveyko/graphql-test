class Comment < ApplicationRecord

  scope :id    , -> (id) { where(id: id) }
  scope :body  , -> (body) { where("body LIKE ?", "%#{body}%") }

  belongs_to :post
  belongs_to :user

end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
