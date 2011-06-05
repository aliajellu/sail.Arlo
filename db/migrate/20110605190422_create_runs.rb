class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.integer :id
      t.integer :uid
      t.string :type
      t.string :version
      t.string :author
      t.integer :run_id

      t.timestamps
    end
  end

  def self.down
    drop_table :runs
  end
end
