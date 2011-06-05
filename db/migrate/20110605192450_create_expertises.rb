class CreateExpertises < ActiveRecord::Migration
  def self.up
    create_table :expertises do |t|
      t.integer :id
      t.integer :uid
      t.string :type
      t.string :version
      t.string :author
      t.integer :run_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :expertises
  end
end
