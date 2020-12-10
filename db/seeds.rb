# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@admin.com', password: '1q2w3e4r!', password_confirmation: '1q2w3e4r!') if Rails.env.development?

User.create!(email:'syang@ajou.ac.kr', password: '123456', last_name:'Yang', first_name:'Shang', detailed_address:'123 Success Street', address: 'New York', zipcode: '11790', age:20, account_number:'1234-5678-1234-5678') if Rails.env.development?
User.create!(email:'vicdu@ajou.ac.kr', password: '123456', last_name:'Du', first_name:'Victor', detailed_address:'456 Fortune Road', address: 'West Lafayette ', zipcode: '11791', age:23, account_number:'5678-1234-5678-1234') if Rails.env.development?
User.create!(email:'jsmith@ajou.ac.kr', password: '123456', last_name:'Smith', first_name:'John', detailed_address:'789 Peace Blvd.', address: 'Los Angeles', zipcode: '93536', age:24, account_number:'2345-6789-2345-6789') if Rails.env.development?
User.create!(email:'pml@ajou.ac.kr', password: '123456', last_name:'Philip', first_name:'Lewis', detailed_address:'135 Knowledge Lane', address: 'Stony Brook', zipcode: '11794', age:25, account_number:'6789-2345-6789-2345') if Rails.env.development?

Actor.create!(actor_name: 'Al Pacino', gender: "Male", age:63, rating:5) if Rails.env.development?
Actor.create!(actor_name: 'Tim Robbins', gender: "Male", age:53, rating:2) if Rails.env.development?

Movie.create!(movie_name: 'The Godfather', movie_type: '드라마', age_limit:19, rating:0, number_of_copies:0) if Rails.env.development?
Movie.create!(movie_name: '쇼생크 탈출', movie_type: '드라마', age_limit:15, rating:0, number_of_copies:0) if Rails.env.development?
Movie.create!(movie_name: 'Borat', movie_type: '코미디', age_limit:19, rating:0, number_of_copies:0) if Rails.env.development?
