# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Week.create(day_name: 'monday')
Week.create(day_name: 'tuesday')
Week.create(day_name: 'wednesday')
Week.create(day_name: 'thursday')
Week.create(day_name: 'friday')
Week.create(day_name: 'saturday')
Week.create(day_name: 'sunday')
