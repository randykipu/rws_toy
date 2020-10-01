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

rake db:migrate
rails s

Check that Rails is running by hitting localhost:8081/
You should get a simple page that says the app is ok.

Next, get the localhost:8081/queue page to look at the 3 emulated queues.
This page will not work without the migrated database and both AWS credentials.
This page will have a form in each queue.
If you type a name in a queue's form, that name will be added to that queue.
A name should only appear in only one of the three queues.
If that name appears in one of the other 2 queues, it will be
deleted from the other queue.
If multiple browsers are looking at the queue/index page, they will all
see the same queues, and will see the names shuffled between their
display of those queues without making a page refresh request.

The QueueController only produces the index page.

The WebsocketController handles websocket communications.

###Current Status:
Websockets are not yet working.

There is not yet any entry form on any of the queues in the queue/index page.
Since there is no javascript on the queue/index page, the only websocket
communication that you can attempt is via the AWS "wscat" tool.
