# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Week.where( id: 0..1000 ).delete_all

start = Date.new(2021, 1, 4)
stop = start + 6

for i in 1..52
	Week.create([{ num: i, start_date: start, end_date: stop }])
	start = start + 7
	stop = start + 6
end