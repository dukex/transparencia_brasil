require 'spec_helper'

describe TransparenciaBrasil do
  describe '.configure' do
    it 'accepts endpoint config' do
      old_endpoint = TransparenciaBrasil.configuration.endpoint
      endpoint = double

      TransparenciaBrasil.configure { |c| c.endpoint = endpoint }

      expect(TransparenciaBrasil.configuration.endpoint).to be endpoint

      TransparenciaBrasil.configure { |c| c.endpoint = old_endpoint }
    end

    it 'accepts token config' do
      token = "AbC123"

      TransparenciaBrasil.configure { |c| c.token = token }

      expect(TransparenciaBrasil.configuration.token).to be token
    end
  end
end
