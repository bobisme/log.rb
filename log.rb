require 'json'
require 'time'

class Log
  @file = STDOUT

  class << self
    attr_accessor :file

    [:info, :error, :fatal, :warn, :debug].each do |level|
      define_method(level) do |msg, **kwargs|
        file.puts JSON.dump kwargs.update(
          level: level, msg: msg,
          at: Time.now.utc.iso8601(6)
        )
      end
    end
  end
end
