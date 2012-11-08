class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :link
      t.string :thumbnail_url
      t.text :embed_code
      t.string :media_type
      t.text :meta_tags
      t.string :domain
      t.string :media_provider
      t.string :author

      t.timestamps
    end
  end
end
