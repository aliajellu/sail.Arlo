class CreateAllowedQuestionTags < ActiveRecord::Migration
  def self.up
    create_table :allowed_question_tags do |t|
      t.integer :question_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :allowed_question_tags
  end
end
