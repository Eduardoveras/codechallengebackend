# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
SocialMedium.delete_all
Topic.delete_all
SocialMedium.create(name: 'Twitter')

Topic.create(name: 'healthcare')
Topic.create(name: 'nasa')
Topic.create(name: 'open source')


