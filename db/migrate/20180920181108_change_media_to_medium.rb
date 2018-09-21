class ChangeMediaToMedium < ActiveRecord::Migration[5.2]
  def change
    remove_reference :social_media_posts, :social_media
    add_reference :social_media_posts, :social_medium, index: true
  end
end
