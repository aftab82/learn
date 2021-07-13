module Log
  APP_PREFIX = "LOG"

  @logger = Logger.new

  def self.error(msg)
    @logger.log("[#{APP_PREFIX}] ERROR", msg)
  end

  def self.info(msg)
    @logger.log("[#{APP_PREFIX}] INFO", msg)
  end

  class Logger
    def log(prefix, msg)
      puts "#{prefix}: #{msg}"
    end
end
