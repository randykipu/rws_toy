class WebsocketController < ApplicationController

  require 'faraday_middleware/aws_sigv4'
  require 'amazing_print'

  AWS_REGION = 'us-east-1'
  API_ID     = '9ucus3fwwj'
  ws_url     = "wss://#{API_ID}.execute-api.#{AWS_REGION}.amazonaws.com/test"
  #             wss://9ucus3fwwj.execute-api.us-east-1.amazonaws.com/test
  app_url    = 'https://console.aws.amazon.com/cloud9/ide/066180cd4f524733bb998679cfa1e14a'
  hit_count  = 0

  ENV['AWS_ACCESS_KEY_ID']     || (puts('No env var AWS_ACCESS_KEY_ID'); exit)
  ENV['AWS_SECRET_ACCESS_KEY'] || (puts('No env var AWS_SECRET_ACCESS_KEY'); exit)

  RANDYS_IP = '136.55.5.229'
  RANDYS_WEBSOCKET_ADDRESS_PREFIX = '3.216'


  def index

  end
end


=begin
  client = Aws::APIGateway::Client.new(region: AWS_REGION)
  conn   = Faraday.new(url: ws_url) do |cfg|
             cfg.request :aws_sigv4,
                         service: 'apigateway',
                         region:   AWS_REGION,
                         access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
                         secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
             cfg.response :json, :content_type => /\bjson\b/
             cfg.response :raise_error
             cfg.adapter Faraday.default_adapter
           end
  resp = conn.get '/test' || 'No response, but no errors either'
  "resp --> #{resp.inspect}"
  end
=end
