require "transparencia_brasil/version"
require "transparencia_brasil/configuration"
require "transparencia_brasil/identity"
require "transparencia_brasil/client"

module TransparenciaBrasil
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
