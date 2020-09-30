ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Don't run on localhost!
require 'rails/commands/server'
module Rails
  class Server
    def default_options
      # Requests to randy-parker.kipu.dev on AWS
      # will get a "502 Bad Gateway" on 8080.
      super.merge(Host:  '0.0.0.0', Port: 8081)
    end
  end
end
