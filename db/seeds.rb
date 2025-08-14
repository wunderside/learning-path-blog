# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create dummy blog posts
posts = [
  {
    title: "Getting Started with Ruby on Rails",
    body: "Ruby on Rails is a web application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern. Rails is opinionated software and assumes that there is a 'best' way to do things, and it's designed to encourage that way—and in some cases to discourage alternatives."
  },
  {
    title: "The Power of Active Record",
    body: "Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database. It is an implementation of the Active Record pattern which itself is a description of an Object Relational Mapping system."
  },
  {
    title: "Building Modern UIs with Hotwire",
    body: "Hotwire is an alternative approach to building modern web applications without using much JavaScript by sending HTML instead of JSON over the wire. This makes for fast first-load pages, keeps template rendering on the server, and allows for a simpler, more productive development experience in any programming language, without sacrificing any of the speed or responsiveness associated with a traditional single-page application."
  }
]

# Clear existing posts to avoid duplicates when re-seeding
BlogPost.destroy_all

# Create the posts
posts.each do |post_attributes|
  BlogPost.create!(post_attributes)
end

puts "Created #{BlogPost.count} blog posts"

user = User.where(email: "wunderside@gmail.com").first_or_initialize
user.update!(password: "password", password_confirmation: "password")
