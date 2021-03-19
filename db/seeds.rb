# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#


User.create({email: 'admin@gmail.com',password: 'adminpassword', firstName: 'Admin',secondName: 'User',role:1})if Rails.env.development?
User.create({email: 'developer1@gmail.com',password: 'devpassword', firstName: 'Developer1',secondName: 'User1',role:0})if Rails.env.development?
User.create({email: 'developer2@gmail.com',password: 'devpassword', firstName: 'Developer2',secondName: 'User2',role:0})if Rails.env.development?

Project.create({name: 'Project1'})if Rails.env.development?
Project.create({name: 'Project2'})if Rails.env.development?

Category.create({name: 'Category1'})if Rails.env.development?
Category.create({name: 'Category2'})if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


