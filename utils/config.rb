require 'yaml'

class Config
  # method to read global config file
  # $config is global variable..
  def self.read_config_file
    $config = YAML.load_file(File.dirname(__FILE__).split("/utils")[0] + '/config/global.yml')
  end
  # method to return implicit_wait from config file
  def self.implicit_wait
    Config.read_config_file
    return ($config["implicit_wait"] || 10)
  end

  # method to return browser from config file
  def self.browser
    Config.read_config_file
    return ($config["browser"] || 'chrome')
  end

  # method to return url from config file
  def self.url
    Config.read_config_file
    return $config["url"]
  end
end
