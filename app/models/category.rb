class Category < ApplicationRecord
	has_many :blogs
	has_many :favorites
	has_many :users, through: :categories
end
