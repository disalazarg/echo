require "./echo/*"
require "option_parser"

module Echo
  # TODO Put your code here
  opts   = Options.new

  OptionParser.parse! do |parser|
    parser.on("-p PORT", "--port PORT", "Specify port to use") { |p| opts.port = p.to_i   }
    parser.on("-c",      "--cors",      "Enable CORS headers") {     opts.cors = true     }
    parser.on("-j FILE", "--json FILE", "Loads a JSON reply")  { |f| opts.file = f        }
    parser.on("-h"     , "--help",      "Shows this help")     {     puts parser; exit(0) }
  end

  Server.new(opts).listen
end
