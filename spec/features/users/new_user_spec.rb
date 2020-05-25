require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit "/"

    click_on "Register as a User"

    expect(current_path).to eq("/users/new")

    username = "funbucket13"
    password = "test"

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}!")
  end
    it "keeps a user logged in after registering" do
    visit "/"

    click_on "Register as a User"

    username = "funbucket13"
    password = "test"

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create User"

    visit '/profile'

    expect(page).to have_content("Hello, #{username}!")
  end
end

RSpec.describe "Logging In" do
  it "can log in with the valid credentials" do
    
    user = User.create(username: "funbucket13", password: "test")

    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log Out")
  end
  it "cannot log in with bad credentials" do

    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end

RSpec.describe "Logging Out" do
  it "can log out after being logged in" do
    
    user = User.create(username: "funbucket13", password: "test")

    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Currently logged in as: #{user.username}")
    expect(page).to have_link("Log Out")

    click_on "Log Out"

    expect(current_path).to eq('/')
    expect(page).to have_content("You have been logged out")
    expect(page).to_not have_content("Currently logged in as: #{user.username}")
    expect(page).to_not have_link("Log Out")
  end
end 