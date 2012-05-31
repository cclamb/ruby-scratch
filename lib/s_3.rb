
require 'logging'

module Logging::Appenders

  def self.s3 *args
    return Logging::Appenders::S3 if args.empty?
    Logging::Appenders::S3.new *args
  end

  class S3 < Logging::Appenders::IO

    def initialize *args
      opts = Hash === args.last ? args.pop : {}
      name = args.empty? ? 's3' : args.shift

      source = opts[:source] || 'unidendified source'

      io = S3IO.new source

      # super name, STDERR, opts
      super name, io, opts
    end

  end

  class S3IO

    def initialize src_name = 'unidentified source'
      @src_name = src_name
    end

    def syswrite msg
      puts "#{msg}source: #{@src_name} "
    end

  end

end