class AddCountersToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :responses_count, :integer, default: 0
    add_column :questions, :correct_count, :integer, default: 0
  end
end
