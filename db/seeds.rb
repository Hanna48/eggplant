# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "eggplant@example.com", password: "ajion2596dhi", role: "admin", name: "root", confirmed_at: "2018-08-23")
User.create(email: "test@example.com", password: "123456", role: "general", name: "general", confirmed_at: "2018-08-23")