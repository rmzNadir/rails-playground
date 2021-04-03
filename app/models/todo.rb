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

  before_validation :set_randome_title_if_nil

  # dependent: :destroy permite, al elminar un todo tambien eliminar los registros asociados, en este caso, fotos
  has_many :photos, dependent: :destroy

  private

  def due_date_is_valid
    errors.add(:due_date, 'La fecha de entrega ya pasó.') if due_date < Datetime.now
  end

  def set_randome_title_if_nil
    self.title ||= (0...8).map { rand(65..90).chr }.join
  end
end
