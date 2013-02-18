class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :name

      t.timestamps
    end
  end
end
