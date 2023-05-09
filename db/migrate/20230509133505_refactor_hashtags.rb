class RefactorHashtags < ActiveRecord::Migration[7.0]
  def change
    change_column :hashtags, :body, :string, null: false
    change_column :hashtags_questions, :hashtag_id, :bigint, null: false
    change_column :hashtags_questions, :question_id, :bigint, null: false
    add_foreign_key :hashtags_questions, :hashtags, column: :hashtag_id
    add_foreign_key :hashtags_questions, :questions, column: :question_id
  end
end
