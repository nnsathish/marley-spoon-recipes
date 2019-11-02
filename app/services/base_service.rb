class BaseService
  attr_reader :response

  def initialize(options = {})
    @response = {}
  end

  def self.call(*args)
    self.new(*args).call
  end

  def success?
    self.response[:error_code].blank?
  end

  def failure?
    !self.success?
  end

  def set_error!(error_code)
    self.response[:error_code] = error_code
    self
  end

  def error
    self.response[:error_code]
  end

  def set_data!(data)
    self.response[:data] = data
    self
  end

  def data
    self.response[:data]
  end

  def log_exception(ex)
    msg = "\nEXCEPTION::#{self.class.name} - #{ex.message}\nBACKTRACE:\n"
    msg << "#{Rails.backtrace_cleaner.clean(ex.backtrace).join("\n")}\n"
    Rails.logger.error(msg)
  end
end
