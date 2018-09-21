require 'sidekiq-scheduler'

class TwitterWorker
  include Sidekiq::Worker
  def perform
    puts "------- Started Twitter Job -------"

    # IMPORTANT NOTE:
    # Since we dont want to have trouble setting up the project quickly,
    # im leaving the keys as strings, but on a real life scenario,
    # those should always be environment variables!!!
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "WSHTJfEl9W3glOJIv6fT0aOqY"
      config.consumer_secret     = "mNr6kitsoQQ0zuKJMDOoEtTjVIgRNn2HCTgnzhpcMD6F6HE5xg"
      config.access_token        = "17106831-xMmTG2MuPAZ47NPFXk7cRnW332DKVMPxE1BPWM4oA"
      config.access_token_secret = "oVQYN4kxWHWX9RPX1assaF8VFgT8Y5e192K4FDqg0rnSE"
    end

    network = SocialMedium.find_by_name('Twitter')

    Topic.all.each do |topic|
      puts "Working on topic: #{topic.name}"
      client.search("#{topic.name} -rt", lang: "en",result_type: "recent").take(50).collect do |tweet|
        post = SocialMediaPost.new(
          text_content: tweet.full_text,
          original_id: tweet.id.to_s,
          social_medium_id: network.id,
          topic_id: topic.id,
          posted_at: tweet.created_at,
          uri: tweet.uri
        )
        post.save!
      end
    end

    puts "------- Finished Twitter Job -------"
  end
end
