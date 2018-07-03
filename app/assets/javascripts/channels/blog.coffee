App.blog = App.cable.subscriptions.create "BlogChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) -> $('#messages').append data
   

  speak: (message) -> @perform 'speak', message: message