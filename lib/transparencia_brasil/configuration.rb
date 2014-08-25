module TransparenciaBrasil
  class Configuration
    attr_accessor :endpoint, :token

    def initialize
      @endpoint = 'https://api.transparencia.org.br/api'
    end
  end
end
