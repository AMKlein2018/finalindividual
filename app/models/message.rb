class Message < ApplicationRecord
	belongs_to :chatroom
	belongs_to :user
	after_create_commit {BroadcastMessageJob.perform_later self}
end
