require 'faker'
require 'open-uri'
require 'nokogiri'


puts "creating users with costumes..."

User.destroy_all

p User.all
###############################################

costumes = [
  {
    title: "Sonic Onesie",
    description: "Be the life of the party, or huddle up to nice cup of hot chocolate on the sofa in this wonderfully soft onesie",
    price: 22,
    location: "2 Rue victor hugo, 75016 Paris",
    user: 0,
    images: ["image_00.jpg", "image_15.jpg"]
  },
  {
    title: "Creepy Sonic",
    description: "Afraid that nobody pays attention to you? Don't worry, in this costume nobody will be able to ignore you.",
    price: 16,
    location: "45 Rue Boileau, Paris",
    user: 0,
    images: ["image_01.jpg", "image_11.jpg"]
  },
  {
    title: "Squirrel Sonic",
    description: "Is it a squirrel? Is it Sonic? Who cares... nobody will recognise you in this anyway",
    price: 34,
    location: "293 Avenue Daumesnil, Paris",
    user: 1,
    images: ["image_02.jpg", "image_12.jpg"]
  },
  {
    title: "Friendly Sonic",
    description: "Before you ask, yes this is Sonic, but let's face it... you get what you pay for!",
    price: 12,
    location: "29 Rue du Roi de Sicile, Paris",
    user: 1,
    images: ["image_03.jpg", "image_07.jpg", "image_13.jpg"]
  },
  {
    title: "Golden Rings",
    description: "Made for those sonic fans out there who need that extra bit of room. Comes with two goooooolden rings!",
    price: 39,
    location: "9 rue Damremont, Paris",
    user: 2,
    images: ["image_04.jpg", "image_17.jpg", "image_09.jpg"]
  },
  {
    title: "Go fast or go home",
    description: "For those ladies wishing to go fast, this outfit will make you the envy of your friends. One ring included, woman not included!",
    price: 29,
    location: "42 Rue Rochebrune, Paris",
    user: 2,
    images: ["image_05.jpg", "image_08.jpg"]
  },
  {
    title: "Cute Sonic",
    description: "Cute and soft, unlike real hedgehogs, run around town with that judging look on your face. Comes with gloves, shoes, onesie and headgear.",
    price: 22,
    location: "2 Rue victor hugo, 75016 Paris",
    user: 3,
    images: ["image_06.jpg", "image_18.jpg", "image_14.jpg"]
  },
  {
    title: "The best Sonic",
    description: "Be the sonic of your dreams with this costume. You will not find better quality or anywhere.",
    price: 22,
    location: "2 Rue victor hugo, 75016 Paris",
    user: 3,
    images: ["image_10.jpg", "image_16.jpg"]
  }
]

#### CREATE USERS ####
users = [
  {
    first_name: 'Stephane',
    last_name: 'Baroux',
    username: 'steph',
    email: 'steph@mail.com',
    password: 'password'
  },
  {
    first_name: 'Gauthier',
    last_name: 'Chabanne',
    username: 'gauthier',
    email: 'gauthier@mail.com',
    password: 'password'
  },
  {
    first_name: 'Arthur',
    last_name: 'De Bailliencourt',
    username: 'kouiyere',
    email: 'arthur@mail.com',
    password: 'password'
  },
  {
    first_name: 'Guillaume',
    last_name: 'Cabaret',
    username: 'lecab',
    email: 'guillaume@mail.com',
    password: 'password'
  }
]
users.each do |user|
  user_info = {
    first_name: user[:first_name],
    last_name: user[:last_name],
    username: user[:username],
    email: user[:email],
    password: 'password'
  }
  new_user = User.new(user_info)
  new_user.save!
end

#### CREATE COSTUMES ####

User.all.each_with_index do |single_user, index|

  costumes.each do |costume|
    if costume[:user] == index
      costume_info = {
        title: costume[:title],
        description: costume[:description],
        image_url: '',
        price: costume[:price],
        location: costume[:location],
        user: single_user
      }
      new_costume = Costume.new(costume_info)
      costume[:images].each do |image|
        cloudinary_img = Cloudinary::Uploader.upload("app/assets/images/sonics/#{image}")
        file = URI.open(cloudinary_img["url"])
        new_costume.photos.attach(io: file, filename: image, content_type: 'image/jpg')
      end
      new_costume.save!
      p "New costume created for #{single_user.first_name}"
    end
  end
end

puts "finished creating users and costumes!"
