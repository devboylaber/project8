# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Generating sample products"
4.times do |n|
  Product.create(name: "product Name", 
  	             description: "Lorem ipsum dolor", 
  	             # image: File.new("#{Rails.root}/public/images/atlantic-salmon#{n}.jpg",
  	             	price: 0.29,
                  active: true)
                 # quantity: 1
  puts "product  created"
end
puts "Sample products created"

puts "Generating sample users"
1.times do |n|
  User.create(email: "user@user.com", 
  	             password: "useruser",
  	             password_confirmation: "useruser")
puts "user created"
end
# puts "Sample users created"
puts "Generating sample users"
1.times do |n|
  User.create(email: "admin@admin.com", 
  	             password: "adminadmin",
  	             password_confirmation: "adminadmin",  
  	             admin: true)
  puts "admin created"
end
# puts "Sample admins created"
puts "Generating sample super admins"
1.times do |n|
  User.create(email: "super@admin.com", 
  	             password: "superadmin",
  	             password_confirmation: "superadmin",  
  	             super_admin: true)
  puts "super admin  created"
end
# puts "Sample super admins created"