class Week < ApplicationRecord
	def date_formated
		"#{start_date.strftime('du %d.%m.%Y')} #{end_date.strftime('au %d.%m.%Y')}"
	end
end
