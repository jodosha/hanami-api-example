# frozen_string_literal: true

MyApi.container.boot(:database) do |container|
  init do
    require "uri"
    require "redis"

    uri = URI.parse(container[:settings].database_url)
    redis = Redis.new(uri: uri.to_s)

    register(:database, redis)
  end

  stop do
    database.stop
  end
end
