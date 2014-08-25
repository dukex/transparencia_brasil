require 'spec_helper'

describe TransparenciaBrasil::Identity::Excelencia do
  describe 'attributes' do
    json = JSON.parse(fixture('excelencias.json').read).first
    subject { TransparenciaBrasil::Identity::Excelencia.new json }

    json.keys.each do |attribute|
      it "have #{attribute}" do
        expect(subject.send(attribute.to_sym)).to eq(json[attribute])
      end
    end
  end
end
