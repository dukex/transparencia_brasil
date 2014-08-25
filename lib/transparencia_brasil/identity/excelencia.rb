module TransparenciaBrasil
  module Identity
    class Excelencia < TransparenciaBrasil::Identity::Base
      attr_reader :id, :nome, :apelido, :casa, :titulo, :CPF, :estado, :partido,
        :miniBio, :cargos, :processos, :bancadas, :partidosPassados,
        :cargosPassados, :estadosPassados, :municipiosPassados, :votosPassados,
        :recursosPassados, :resultadosPassados, :anosPassados
    end
  end
end
