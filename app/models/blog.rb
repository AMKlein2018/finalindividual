class Blog < ApplicationRecord
	acts_as_votable
	belongs_to :user
	belongs_to :category
	has_many :comments, dependent: :destroy
	mount_uploader :image, ImageUploader
end
