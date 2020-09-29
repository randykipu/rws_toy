## Randy's Rails 4.2 websocket toy app
### rws_toy
There is also a Sinatra ws_toy, but it handles websocket routing in a completely different way than
Rails, so it has been abandoned. Because who cares how Sinatra would do it, healthmatters is a Rails
app.

Using AWS API Gateway websockets.
ActionCable is not available until Rails 5.

Set both required AWS credentials before hitting /websockets
- **AWS_ACCESS_KEY_ID**
- **AWS_SECRET_ACCESS_KEY**
