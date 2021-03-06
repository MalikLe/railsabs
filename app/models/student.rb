class Student < ApplicationRecord
	has_many :periods
	has_many :results
	belongs_to :group
end
