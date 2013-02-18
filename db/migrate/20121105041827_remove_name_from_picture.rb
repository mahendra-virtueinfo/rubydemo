class RemoveNameFromPicture < ActiveRecord::Migration
  def up
    remove_column :pictures, :name
  end

  def down
    add_column :pictures, :name, :string
  end
end
