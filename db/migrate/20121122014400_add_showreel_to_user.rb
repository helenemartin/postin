class AddShowreelToUser < ActiveRecord::Migration
  def change
    add_column :users, :showreel, :string
  end
end
