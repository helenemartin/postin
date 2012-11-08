class AddAvatarToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar, :binary
  end
end
