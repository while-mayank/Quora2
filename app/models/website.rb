class Website < ApplicationRecord
	has_many :users, through: :blogs
	has_many :blogs
end
