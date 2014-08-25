require 'spec_helper'

describe TransparenciaBrasil::Excelencia do

  describe '.all' do
    before do
      stub_get("/v1/excelencias?casa=1").to_return(body: fixture('excelencias.json'))
      stub_get("/v1/excelencias?casa=2").to_return(body: fixture('excelencias.json'))
    end

    it 'call API (with casa as 1)' do
      TransparenciaBrasil::Excelencia.all(TransparenciaBrasil::Excelencia::CAMARAFEDERAL)
      expect(a_get("/v1/excelencias?casa=1")).to have_been_made
    end

    it 'call API (with casa as 2)' do
      TransparenciaBrasil::Excelencia.all(TransparenciaBrasil::Excelencia::SENADO)
      expect(a_get("/v1/excelencias?casa=2")).to have_been_made
    end

    it 'returns a TransparenciaBrasil::Identity::Excelencia' do
      expect(TransparenciaBrasil::Excelencia.all(TransparenciaBrasil::Excelencia::CAMARAFEDERAL).first).
        to be_kind_of(TransparenciaBrasil::Identity::Excelencia)
    end
  end

  describe '.get' do
    before do
      stub_get("/v1/excelencias/1").to_return(body: fixture('excelencia.json'))
    end

   it 'call API ' do
      TransparenciaBrasil::Excelencia.get(1)
      expect(a_get("/v1/excelencias/1")).to have_been_made
    end

    it 'returns a TransparenciaBrasil::Identity::Excelencia' do
      expect(TransparenciaBrasil::Excelencia.get(1)).
        to be_kind_of(TransparenciaBrasil::Identity::Excelencia)
    end
  end
end
