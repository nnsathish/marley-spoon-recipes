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

  def set_error!(error_msg)
    self.response[:error_code] = error_msg.to_s
  end

  def error
    self.response[:error_code]
  end
end
