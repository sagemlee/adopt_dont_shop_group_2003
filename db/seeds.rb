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

shelter1.reviews.create(title: "Love This Place", rating: 5, content:"This is my favorite shelter.", img_url: "https://cdn2-www.dogtime.com/assets/uploads/2010/12/adopt-a-pet-dog-puppy-3.jpg")
shelter1.reviews.create(title: "Only Alright", rating: 3, content:"This place is okay.", img_url: "https://www.mercurynews.com/wp-content/uploads/2017/10/sjm-l-shelter-1101-22.jpg?w=620")
shelter2.reviews.create(title: "Hate This Place", rating: 1, content:"Go somewhere else to adopt, trust me.", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")

application1.create(name: "App 1", address: "1 Imaginary Dr", city: "City 1", state: "State 1", zipcode: "Zip 1", phone_number: "111-111-1111", description: "Description 1")
application2.create(name: "App 2", address: "2 Imaginary Dr", city: "City 2", state: "State 2", zipcode: "Zip 2", phone_number: "222-222-2222", description: "Description 2")
