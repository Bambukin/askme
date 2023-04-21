class AddConstantsToQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :body, :text, null: false
    change_column :questions, :user_id, :integer, null: false
  end
end
