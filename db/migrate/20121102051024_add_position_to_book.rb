class AddPositionToBook < ActiveRecord::Migration
  def change
    add_column :books, :position, :integer
  end
end
