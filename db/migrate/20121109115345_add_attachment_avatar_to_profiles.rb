class AddAttachmentAvatarToProfiles < ActiveRecord::Migration
  def self.up
    begin
    change_table :profiles do |t|
      t.has_attached_file :avatar
    end
    rescue
    end
  end

  def self.down
    drop_attached_file :profiles, :avatar
  end
end
