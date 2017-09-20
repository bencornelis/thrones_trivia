class AddCorrectToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :correct, :boolean, default: false
  end
end
