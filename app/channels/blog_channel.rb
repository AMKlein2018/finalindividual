class BlogChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "blog_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	# Message.create content: data['message'], user: current_user
  end
end
