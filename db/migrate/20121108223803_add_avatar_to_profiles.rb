class AddAvatarToProfiles < ActiveRecord::Migration
   def change
     begin
    change_table :profiles do |t|
      t.attachment :avatar
    end
     rescue
     end
  end
end
