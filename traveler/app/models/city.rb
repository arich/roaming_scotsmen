class City < ActiveRecord::Base
	has_many :attractions
	has_many :categories
end
