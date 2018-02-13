module Echo
  class Options
    property port : Int32
    property cors : Bool
    property file : String?

    def initialize(@port : Int32 = 8080, @cors : Bool = false, @file : String? = nil)
    end
  end
end