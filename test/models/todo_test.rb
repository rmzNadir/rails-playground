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
require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'title should not be empty' do
    todo = Todo.new
    todo.save
    assert todo.errors.any?, 'No errors found'
  end

  test 'todo is saved if title is present' do
    todo = Todo.new
    todo.title = 'Hola mundo'
    todo.save
    assert todo.persisted?, "Couldn't save todo"
  end
end
