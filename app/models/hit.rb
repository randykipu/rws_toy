class Hit < ActiveRecord::Base
  # attrs: method, count, origin, payload
  # "method"  Expected to be [http, websocket]
  # "origin"  The ip address from which the request was sent
  # "count"   Records how many http requests have been receieved.
  #           Maybe the "count" can be extended to include websocket frames.
  # "payload" For http, this would be the params.
  #           For ws, it would be the json in the frame.
end
