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
  validates :title, presence: true
  validates :image_url, presence: true, format: { with: /.\.(png|jpeg|jpg|gif)/ }

  def self.paginate(page = 1, per_page = 15)
    Photo.order('id desc').offset((page - 1) * per_page).limit(per_page)
  end
end
