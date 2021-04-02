# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  due_date    :datetime
#  priority    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Todo < ApplicationRecord
  validates :title, presence: true
  validate :due_date_is_valid

  def due_date_is_valid
    errors.add(:due_date, 'La fecha de entrega ya pasó.') if due_date < Datetime.now
  end
end
