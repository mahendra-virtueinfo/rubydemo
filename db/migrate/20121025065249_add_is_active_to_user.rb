class AddIsActiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_active, :enum, :limit => ['0', '1'], :default => 1
  end
end
