# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tweets = [
    {message: 'I like cake'},
    {message: 'I like taking photos of my cake before I eat it'},
    {message: 'I like Jake\'s cake'}
]
Tweet.create(tweets)

# Tweet.delete_all