class AddFieldsToSocialMediaPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_media_posts, :posted_at, :date
    add_column :social_media_posts, :uri, :string
  end
end
