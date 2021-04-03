# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image_url  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer          not null
#
# Indexes
#
#  index_photos_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  todo_id  (todo_id => todos.id)
#
class Photo < ApplicationRecord
  validates :title, presence: true, uniqueness: { message: '%{value} es un valor que ya fue usado para %{attribute}' }
  validates :image_url, presence: true, format: { with: /.\.(png|jpeg|jpg|gif)/, message: 'La URL no es válida' }

  belongs_to :todo
  has_and_belongs_to_many :tags

  # Photo.latest(1)
  scope :latest, ->(limit) { order('id desc').limit(limit) }

  def self.paginate(page = 1, per_page = 15)
    Photo.order('id desc').offset((page - 1) * per_page).limit(per_page)
  end
end
