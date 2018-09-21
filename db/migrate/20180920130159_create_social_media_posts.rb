class CreateSocialMediaPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media_posts do |t|
      t.string :text_content
      t.references :topic, foreign_key: true
      t.references :social_media, foreign_key: true

      t.timestamps
    end
  end
end
