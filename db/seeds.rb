# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create!(
  email: "heru@project89.org",
  password: "test888",
  password_confirmation: "test888",
  role: "admin"
  )


User.create!(
  email: "m.sharpe@project89.org",
  password: "test888",
  password_confirmation: "test888",
  role: "admin"
  )


def imageGet(name)
  suckr = ImageSuckr::GoogleSuckr.new
  image = suckr.get_image_url({ "q" => "#{name}" })
  while image.length > 255 && image !=nil
    image = suckr.get_image_url({ "q" => "#{name}" })
  end
  return image
end

100.times do |i|
  @name = Faker::Commerce.product_name
  Product.create!(
    name: "#{@name}",
    description: "#{Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)}",
    url: "#{imageGet(@name)}",
    price_in_cents: "#{Faker::Number.number(4)}"
    )
end