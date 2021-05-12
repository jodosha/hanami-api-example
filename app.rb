# frozen_string_literal: true

require "hanami/api"
require "hanami/api/container"
require "redis"

class MyApi < Hanami::API
  extend Hanami::API::Container

  register "database" do
    Redis.new(host: ENV["REDIS_PORT_6379_TCP_ADDR"], port: ENV["REDIS_PORT_6379_TCP_PORT"])
  end

  root do
    database.keys.join(", ")
  end
end
