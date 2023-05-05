class CreateHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags do |t|
      t.string :body

      t.timestamps
    end
    add_index :hashtags, :body, unique: true

    create_table :hashtags_questions do |t|
      t.belongs_to :hashtag
      t.belongs_to :question
    end
  end
end
