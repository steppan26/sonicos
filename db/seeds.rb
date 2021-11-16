require 'faker'
require 'open-uri'
require 'nokogiri'

puts "creating users with costumes..."

User.destroy_all

p User.all

url = 'https://www.google.com/search?q=sonic%20cosplay&tbm=isch&tbs=isz:l&client=safari&hl=en&sa=X&ved=0CAIQpwVqFwoTCMC0nuz1nPQCFQAAAAAdAAAAABAD&biw=1440&bih=795#imgrc=n2ELREW7tNJkTM'

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

images = []

html_doc.search('img').first(9).each do |element|
  images << element.attributes["src"].value
end


3.times do
  user_info = {
    first_name: Faker::Name.unique.first_name  ,
    last_name: Faker::Name.unique.last_name,
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: 'password123',
  }
  new_user = User.new(user_info)
  new_user.save!

  3.times do
    img_url = images.last
    images.pop
    costume_info = {
      title: Faker::Game.title,
      description: Faker::Quote.famous_last_words,
      image_url: img_url,
      price: rand(20..60).to_f,
      location: Faker::Address.city,
      user: new_user
    }
    new_costume = Costume.new(costume_info)
    new_costume.save!
  end
end

puts "finished creating users!"
