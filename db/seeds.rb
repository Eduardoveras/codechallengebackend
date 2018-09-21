# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
unless SocialMedium.find_by_name('Twitter').exists?
  SocialMedium.create(name: 'Twitter')
end


unless Topic.find_by_name('healthcare').exists?
  Topic.create(name: 'healthcare')
end
unless Topic.find_by_name('nasa').exists?
  Topic.create(name: 'nasa')
end
unless Topic.find_by_name('open source').exists?
  Topic.create(name: 'open source')
end


