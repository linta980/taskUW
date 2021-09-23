require 'yaml'
module Libraries
  class Config

=begin
    $config=nil
    def initialize
      $config = YAML.load_file(File.dirname(__FILE__ ).split("/utils")[0] + '/config/global.yml')
    end
=end
    def self.read_config_file
      $config = YAML.load_file(File.dirname(__FILE__ ).split("/utils")[0] + '/config/global.yml')
    end

    def self.implicit_wait
      Config.read_config_file
      return ($config["implicit_wait"] || 10)
    end

    def self.browser
      Config.read_config_file
      return ($config["browser"] || 'chrome')
    end

    def self.url
      Config.read_config_file
      return $config["url"]
    end
  end
end
