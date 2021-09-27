$log_array = []

module Libraries
  class Log

    # current time
    def self.current_time
      return "[" + Time.now.localtime.to_s + "]"
    end

    # when test passes
    def self.pass(message)
      message = Log.current_time + "PASS          " + message
      $log_array.append(message)
      puts(message)

    end

    #when test fails
    def self.fail(message)
      message = Log.current_time + "FAIL        " + message
      $log_array.append(message)
      puts(message)

    end

    # info for test
    def self.info(message)
      message = Log.current_time + "INFO        " + message
      $log_array.append(message)
      puts(message)
    end

    # file for test
    def self.file(message)
      message = Log.current_time + "FILE    " + message
      $log_array.append(message)
      puts(message)
    end

    #after step
    def self.step(message)
      message = Log.current_time + "STEP        " + message
      $log_array.append(message)
      puts(message)
    end

    # test log
    def self.test(message)
      message = Log.current_time + "TEST      " + message
      $log_array.append(message)
      puts(message)
    end
  end
end

#on exit to write to log.txt file in reports folder that tests started.. just info
at_exit {
  File.open("reports/logs/log.txt", "w") do |f|
    f.write "Test started at #{Time.now.localtime.to_s} "
  end
}
