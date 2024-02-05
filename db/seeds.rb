# #MY OLD SEED MOVIE TITLE/QUOTE=>Title/Content
# 6.times do
#   Post.create(title: Faker::Movie.title, content: Faker::Movie.quote, visible: [true, false].sample)
# end

# #FORMAT FOR THIS POST
# 300.times do
#   Post.create(
#     title: Faker::Name.name,
#     body: Faker::Lorem.paragraph(sentence_count: 2)
#   )
# end




# 18.times do
#   Post.create(title: Faker::Movie.title, body: Faker::Movie.quote)
# end

# 15.times do
#   Product.create(name: Faker::Movie.title, category: Faker::Cannabis.category, desc: Faker::Movie.quote)
# end

15.times do
  Movie.create(name: Faker::Movie.title, category: Faker::Cannabis.category, desc: Faker::Movie.quote)
end
