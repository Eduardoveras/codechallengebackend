class AddOriginalIdToSocialMediaPost < ActiveRecord::Migration[5.2]
  def change
    add_column :social_media_posts, :original_id, :string
  end
end
