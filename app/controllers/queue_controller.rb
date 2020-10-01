class QueueController < ApplicationController

  require 'faraday_middleware/aws_sigv4'
  require 'amazing_print'

  @aws_region = 'us-east-1'
  @api_id     = '9ucus3fwwj'
  @ws_url     = "wss://#{@api_id}.execute-api.#{@aws_region}.amazonaws.com/test"
  #              wss://9ucus3fwwj.execute-api.us-east-1.amazonaws.com/test
  @app_url    = 'https://console.aws.amazon.com/cloud9/ide/066180cd4f524733bb998679cfa1e14a'
  hit_count  = 0

  AWS_ID  = ENV['AWS_ACCESS_KEY_ID']
  AWS_KEY = ENV['AWS_SECRET_ACCESS_KEY']

  RANDYS_IP = '136.55.5.229'
  RANDYS_WEBSOCKET_ADDRESS_PREFIX = '3.216'


  def index
    method_str  = "#{request.env['REQUEST_METHOD']} #{request.env['rack.url_scheme']}"
    payload_str =  request.env['QUERY_STRING']
    cnt  = Hit.count
    @hit = Hit.new(count: cnt, method: method_str, origin: request.ip, payload: payload_str)
    @hit.save!
    #puts "#{'==='*12} hit cnt: #{@cnt}"
    #ap request.env
    check_env
  end

  private

  def check_env
    @aws_id_msg  = "AWS_ACCESS_KEY_ID ---> #{AWS_ID ? 'Available' : 'Missing'}"
    @aws_key_msg = "AWS_SECRET_ACCESS_KEY --->  #{AWS_KEY ? 'Available' : 'Missing'}"
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
