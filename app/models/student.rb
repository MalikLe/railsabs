class Student < ApplicationRecord
	has_many :periods
	has_many :scores
	belongs_to :group
end
