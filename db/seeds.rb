# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




User.create(:first_name => 'Deep', :last_name => 'Gupta', :age => 35)
User.create(:first_name => 'Raj', :last_name => 'Aryan', :age => 40)


Hotel.create(:name => 'Moon Light', :location => 'Noida', :no_of_rooms => 5)
Hotel.create(:name => 'Taj', :location => 'Delhi', :no_of_rooms => 10)
Hotel.create(:name => 'Radission', :location => 'Indore', :no_of_rooms => 15)
Hotel.create(:name => 'Sun Light', :location => 'Mumbai', :no_of_rooms => 20)
Hotel.create(:name => 'Happy Stay', :location => 'New York', :no_of_rooms => 25)
