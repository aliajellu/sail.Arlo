class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :id
      t.integer :uid
      t.string :type
      t.string :version
      t.string :author
      t.integer :run_id
      t.string :image_path
      t.string :correct_answer
      t.string :choice_limit
      t.integer :expertise_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
