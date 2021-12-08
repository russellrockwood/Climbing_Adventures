# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@yosemite = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California', has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
@royal_arches = @yosemite.climbs.create!(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a', number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)
@dawn_wall = @yosemite.climbs.create!(name: 'The Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c', number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)


@manila = City.create!(name:'Manila', travel_advisory: true, population: 1780000)
@manila.hostels.create!(name: 'Tambayan Hostel', vacancies: true, max_occupancy: 45)
@manila.hostels.create!(name: 'K&A Malate', vacancies: true, max_occupancy: 35)
@manila.hostels.create!(name: 'Ola Hostel', vacancies: false, max_occupancy: 25)
