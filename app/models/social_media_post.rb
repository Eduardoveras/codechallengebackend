class SocialMediaPost < ApplicationRecord
  belongs_to :topic,  class_name: 'Topic', optional: true
  belongs_to :social_media, class_name: 'SocialMedium', optional: true
end
