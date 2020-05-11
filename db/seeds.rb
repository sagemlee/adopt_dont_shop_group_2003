# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


shelter1 = Shelter.create(name: "Denver Animal Shelter", address: "123 Imaginary Dr.", city: "Denver", state: "CO", zip: "80203")
shelter2 = Shelter.create(name: "Lakewood Animal Shelter", address: "123 Imaginary Dr.", city: "Lakewood", state: "CO", zip: "80020")
shelter3 = Shelter.create(name: "Broomfield Animal Shelter", address: "123 Imaginary Dr.", city: "Broomfield", state: "CO", zip: "80010")

shelter1.pets.create(name: "Fluffy", age: 1, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog1.jpg", adoption_status: "adoptable", description: "cute and fluffy")
shelter1.pets.create(name: "Fido", age: 8, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog1.jpg", adoption_status: "adoptable", description: "super cute")
shelter1.pets.create(name: "Chester", age: 5, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog1.jpg", adoption_status: "pending", description: "cute")
shelter2.pets.create(name: "Luna", age: 2, sex: "female", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog3.jpeg", adoption_status: "adoptable", description: "cute")
shelter2.pets.create(name: "Baxter", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "adoptable", description: "cute")
shelter2.pets.create(name: "Baxter", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "pending", description: "cute")
shelter3.pets.create(name: "Lilly", age: 2, sex: "female", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "adoptable", description: "cute")
shelter3.pets.create(name: "Maggie", age: 2, sex: "female", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "adoptable", description: "cute")
shelter3.pets.create(name: "Rommel", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "pending", description: "cute")
