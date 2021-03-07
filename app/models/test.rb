class Test < ApplicationRecord
	belongs_to :subject
	belongs_to :group
	has_many :scores
end
