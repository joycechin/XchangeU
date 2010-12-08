class CreateAcademics < ActiveRecord::Migration
  def self.up
    create_table :academics do |t|
      t.string :teach
      t.string :learn
      t.integer :user_id

      t.timestamps
    end
    add_index :academics, :user_id
  end

  def self.down
    drop_table :academics
  end
end
