module TransparenciaBrasil
  class Excelencia < TransparenciaBrasil::Client
    CAMARAFEDERAL = 1
    SENADO = 2

    def self.all(casa, options = {})
      params = options.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
      params[:casa] = casa
      get_entity(TransparenciaBrasil::Identity::Excelencia, 'v1/excelencias', params)
    end
  end
end
