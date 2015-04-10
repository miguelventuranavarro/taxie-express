# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts "Importing districts..."
CSV.foreach(Rails.root.join("distritos_lima.csv"), headers: true) do |row|
  District.create! do |district|
    district.id = row[0]
    district.name = row[1]
  end
end

puts "Importing zones..."
CSV.foreach(Rails.root.join("zonas_lima.csv"), headers: true) do |row|
  Zone.create! do |zone|
    zone.name = row[1]
    zone.district_id = row[2]
  end
end