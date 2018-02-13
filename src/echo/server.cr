require "json"
require "http/server"

module Echo
  class Server
    property json   : String?
    property server : HTTP::Server

    def initialize(options)
      # JSON response file provided
      if options.file && File.exists?(options.file.as(String))
        @json = JSON.parse(File.read(options.file.as(String))).to_json
      end

      @server = HTTP::Server.new options.port do |context|
        if options.cors
          context.response.headers["Access-Control-Allow-Origin"]  = "*"
          context.response.headers["Access-Control-Allow-Methods"] = "*"
          context.response.headers["Access-Control-Allow-Headers"] = "*"
        end

        reply(context)
      end

      puts "Listening in on #{options.port}"
    end

    def listen
      @server.listen
    end

    def reply(context)
      json = JSON.parse "{}"

      puts "#{Time.now} [#{context.request.method}] #{context.request.path}"
      
      if body = context.request.body
        json = JSON.parse body.gets_to_end
        puts "\tdata: #{json.to_json}"
      end

      context.response.content_type = "application/json"
      context.response.print (@json ? @json : json.to_json)
    end
  end
end