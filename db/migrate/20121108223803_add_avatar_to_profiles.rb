class AddAvatarToProfiles < ActiveRecord::Migration
   def change
    create_table :profiles do |t|
      t.attachment :avatar
    end
  end
end