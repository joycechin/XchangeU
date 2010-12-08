class AddDescrtiptionToAcademic < ActiveRecord::Migration
  def self.up
    add_column :academics, :description, :string
  end

  def self.down
    remove_column :academics, :description
  end
end
