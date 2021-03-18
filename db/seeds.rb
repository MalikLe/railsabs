# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Week.where( id: 0..1000 ).delete_all

##### Populate DB with 2021 weeks
=begin
	start = Date.new(2021, 1, 4)
	stop = start + 6

	for i in 1..52
		Week.create([{ num: i, start_date: start, end_date: stop }])
		start = start + 7
		stop = start + 6
	end
=end

#Period.delete_all

#### Populate DB with periods
#=begin
Student.all.each do |student|
	Week.all.each do |week|
		for d in 1..5
			for i in 1..7
				Period.create([{ week_id: week.id, day: d, student_id: student.id, state: 0 }])
			end
		end
	end
end
#=end

##### Populate DB with real students (CSV)
=begin
require 'csv'

CSV.foreach(Rails.root.join('csv/students.csv'), headers: true, :col_sep => ?;, encoding: "ISO8859-1") do |row|
	Student.create! do |student|
		student.class_id = Group.where(:name => row[5]).first.id
		student.last_name = row[0]
		student.first_name = row[1]
		student.birth_date = row[2]
		student.email = row[3]
		student.phone = row[4]
		student.class_name = row[5]
		student.serial_num = row[6]
		
		
	end
end
=end

#### Populate DB with classes (CSV)
=begin
require 'csv'

CSV.foreach(Rails.root.join('csv/groups.csv'), headers: false, encoding: "ISO8859-1") do |row|
	Group.create! do |group|
		group.name = row[0]
		
	end
end
=end