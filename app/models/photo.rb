# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key, has index for faster ordering
#  title      :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  validates :title, presence: true, uniqueness: { message: '%{value} es un valor que ya fue usado para %{attribute}' }
  validates :image_url, presence: true, format: { with: /.\.(png|jpeg|jpg|gif)/, message: 'La URL no es válida' }

  # Photo.latest(1)
  scope :latest, ->(limit) { order('id desc').limit(limit) }

  def self.paginate(page = 1, per_page = 15)
    Photo.order('id desc').offset((page - 1) * per_page).limit(per_page)
  end
end
