# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gabriel = Client.create! id: SecureRandom.uuid, first_name: 'Gabriel', last_name: 'Sánchez', email: 'gabriel@email.com'
antonio = Client.create! id: SecureRandom.uuid, first_name: 'Antonio', last_name: 'Ciarrocchi', email: 'antonio@email.com'

mr_pink = Coach.create! id: SecureRandom.uuid, name: 'Mr. Pink', hourly_rate_in_cents: 10_000
mr_orange = Coach.create! id: SecureRandom.uuid, name: 'Mr. Orange', hourly_rate_in_cents: 5_000


Session.create! coach: mr_pink, client: gabriel, start: DateTime.now, duration: 60
Session.create! coach: mr_pink, client: antonio, start: DateTime.now + 12.hours, duration: 45
Session.create! coach: mr_orange, client: gabriel, start: DateTime.now + 1.day, duration: 30
Session.create! coach: mr_orange, client: antonio, start: DateTime.now + 36.hours, duration: 90
