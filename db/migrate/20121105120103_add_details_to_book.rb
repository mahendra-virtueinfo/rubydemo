class AddDetailsToBook < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.references :category
    end
    add_index :books, :category_id
  end
end
