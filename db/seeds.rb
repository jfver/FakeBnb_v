# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "clearing db"
Bookmark.destroy_all
Booking.destroy_all
Product.destroy_all
User.destroy_all
puts "generating User"
User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty", photo: "Zelda.jpg", description:  "I am a central character in The Legend Of Zelda series. I am a member of the royal family of Hyrule. I found myself in the past, 10.000 years before the calamity, by touching the secret stone of Rauru.")
User.create(username: "supertoto", email: "toto@gmail.com", password: "azerty")

5.times do
Product.create!(user_id: User.first.id, title: "Riju, Gerudo's chief", 
description: "Riju (ルージュ Rūju) or Makeela Riju (her full name) is a recurring character in The Legend of Zelda series. She is the leader of the Gerudo tribe.
She wields two scimitars of the moonlight with grace and proves to be the Thunder Sage.", 
category: "Gerudo", price: 200, image_link: "Riju.png")

Product.create!(user_id: User.first.id, title: "Urbosa, Former Gerudo's chief", 
description: "Urbosa is a Gerudo Champion who pilots the Divine Beast Vah Naboris. She is capable of manipulating lightning using her technique, Urbosa's Fury.
Urbosa battled with the Scimitar of the Seven and the Daybreaker shield. It is said that Urbosa's movements resembled a beautiful dance when using the Scimitar of the Seven.", 
category: "Gerudo", price: 250, image_link: "Urbosa.jpg")
end
puts "Seed updated successfully"