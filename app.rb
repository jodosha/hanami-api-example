# frozen_string_literal: true

require "hanami/api"
require "hanami/api/container"

class Foo
  def call(arg)
    arg.to_s.upcase
  end
end

class MyApi < Hanami::API
  extend Hanami::API::Container

  settings do
    key :database_url, Types::String.constrained(filled: true)
  end

  register "foo" do
    Foo.new
  end

  root do
    foo.call("hello")
  end

  get "/keys" do
    database.keys.join(", ")
  end
end
