# frozen_string_literal: true

# Load seeds
Dir["#{Rails.root}/db/seeds/**/*.rb"].each { |file| load file }

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PROJECTS = {
  "BluePlanet": %w[TimeTracker L&D Vacation PreSales Coaching],
  "MoMA": %w[CorporateMembership],
  "HuisVoorVeerkracht": %w[Ally IedereenOk Toolbox]
}.freeze

p('Users')
seed_users

p('Ciients')
seed_clients(PROJECTS.keys)

p('Projects')
seed_projects(PROJECTS)

p('Timelogs')
seed_timelogs(14)
