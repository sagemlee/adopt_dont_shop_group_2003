# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.destroy_all
Application.destroy_all
PetApplication.destroy_all
Pet.destroy_all
Review.destroy_all

shelter1 = Shelter.create(name: "Denver Animal Shelter", address: "123 Imaginary Dr.", city: "Denver", state: "CO", zip: "80203")
shelter2 = Shelter.create(name: "Lakewood Animal Shelter", address: "123 Imaginary Dr.", city: "Lakewood", state: "CO", zip: "80020")
shelter3 = Shelter.create(name: "Broomfield Animal Shelter", address: "123 Imaginary Dr.", city: "Broomfield", state: "CO", zip: "80010")
shelter4 = Shelter.create(name: "Exotic Pets Shelter", address: "123 Imaginary Dr.", city: "Silverthorne", state: "CO", zip: "80000")

pet1 = shelter1.pets.create(name: "Fluffy", age: 1, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog1.jpg", adoption_status: "adoptable", description: "cute and fluffy")
pet2 = shelter1.pets.create(name: "Fido", age: 8, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "adoptable", description: "super cute")
pet3 = shelter1.pets.create(name: "Chester", age: 5, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/IMG_0015.JPG", adoption_status: "adoptable", description: "cute")
pet4 = shelter2.pets.create(name: "Luna", age: 2, sex: "female", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog5.jpg", adoption_status: "adoptable", description: "cute")
pet5 = shelter2.pets.create(name: "Baxter", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog6.jpg", adoption_status: "adoptable", description: "cute")
pet6 = shelter2.pets.create(name: "Balto", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog7.jpg", adoption_status: "adoptable", description: "cute")
pet7 = shelter3.pets.create(name: "Lilly", age: 2, sex: "female", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog8.jpeg", adoption_status: "adoptable", description: "cute")
pet8 = shelter3.pets.create(name: "Maggie", age: 2, sex: "female", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog2.jpg", adoption_status: "adoptable", description: "cute")
pet9 = shelter3.pets.create(name: "Rommel", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/rommel.jpg", adoption_status: "adoptable", description: "cute")
pet10 = shelter4.pets.create(name: "Kitty", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/cat1.jpeg", adoption_status: "adoptable", description: "cute")
pet11 = shelter4.pets.create(name: "Lilly", age: 2, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/cat2.jpg", adoption_status: "adoptable", description: "cute")

review1 = shelter1.reviews.create(title: "Love This Place", rating: 5, content: "This is my favorite shelter.", img_url: "https://cdn2-www.dogtime.com/assets/uploads/2010/12/adopt-a-pet-dog-puppy-3.jpg")
review2 = shelter1.reviews.create(title: "Great", rating: 10, content: "Amazing", img_url: "https://www.mercurynews.com/wp-content/uploads/2017/10/sjm-l-shelter-1101-22.jpg?w=620")
review3 = shelter1.reviews.create(title: "Only Alright", rating: 3, content: "This place is okay.", img_url: "https://www.mercurynews.com/wp-content/uploads/2017/10/sjm-l-shelter-1101-22.jpg?w=620")
review4 = shelter2.reviews.create(title: "Hate This Place", rating: 1, content: "Go somewhere else to adopt, trust me.", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")
review5 = shelter2.reviews.create(title: "Probably won't come back", rating: 2, content:"Not coming back", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")
review6 = shelter2.reviews.create(title: "Not good", rating: 4, content: "They need to imporove", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")
review7 = shelter3.reviews.create(title: "Best shelter around", rating: 10, content:"Fantastic service", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")
review8 = shelter3.reviews.create(title: "Fantastic", rating: 9, content: "Telling all my friends", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")
review9 = shelter3.reviews.create(title: "Well run", rating: 9, content: "Loved the staff here", img_url: "https://media.npr.org/assets/img/2013/02/06/dog_wide-e19af42dcba6ac82e35773015db5d04ef49c9beb-s1600-c85.jpg")
review10 = shelter4.reviews.create(title: "Strange animals here", rating: 7, content: "Didn't know you could adopt possums!", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/possum.jpg")
review11 = shelter4.reviews.create(title: "Lizards?", rating: 8, content: "I take my lizard on a walk everyday!", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/komodo.jpg")

application1 = Application.create(name: "Bill", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")
application2 = Application.create(name: "Mary", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")
application3 = Application.create(name: "Cletus", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")
application4 = Application.create(name: "Billy-Bob", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")
application5 = Application.create(name: "Derek", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")
application6 = Application.create(name: "Sage", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")
application7 = Application.create(name: "Jim", address: "321 Made Up Dr.", city: "Denver", state: "CO", zipcode: "80000", phone_number: "111-111-1111", description: "I want this pet!")

PetApplication.create(pet: pet1, application: application1)
PetApplication.create(pet: pet3, application: application1)
PetApplication.create(pet: pet7, application: application2)
PetApplication.create(pet: pet7, application: application3)
PetApplication.create(pet: pet7, application: application4)
PetApplication.create(pet: pet10, application: application5)