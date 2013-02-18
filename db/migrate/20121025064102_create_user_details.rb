class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.text :address
      t.string :phone
      t.string :facebook_id
      t.string :twitter_id
      t.references :user

      t.timestamps
    end
    add_index :user_details, :user_id
  end
end
