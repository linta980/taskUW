

$log_array=[]

module Libraries
  class Log
    def self.current_time
      return "[" +Time.now.localtime.to_s+ "]"
    end

    def self.pass(message)
      time = Log.current_time + "PASS "
      $log_array.append(time + message)
    end

    def self.fail(message)
      time =Log.current_time + "FAIL "
      $log_array.append(time + message)
    end
    def self.info(message)
      message = Log.current_time + "INFO    "
      $log_array.append(message)
    end

    # To print the file logs
    def self.file(message)
      message = Log.current_time + "FILE    " + message
      $log_array.append(message)
      puts(message)
    end

    def self.step(message)
      message = Log.current_time + "STEP        " + message
      $log_array.append(message)
      puts(message)
    end
    # To print the test logs
    def self.test(message)
      message = Log.current_time + "TEST      " + message
      $log_array.append(message)
      puts(message)
    end
  end
end

at_exit {
  File.open("reports/logs/log.txt", "w") do  |f|
    f.write "Test started at #{Time.now.localtime.to_s} "
  end
}
