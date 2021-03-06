class Group < ApplicationRecord
	has_many :students
	has_many :tests
end
