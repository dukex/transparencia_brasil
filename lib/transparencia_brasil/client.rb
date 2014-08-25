require "addressable/uri"
require "active_support/core_ext/object/to_query"
require "json"

module TransparenciaBrasil
  class Client
    class << self
      def endpoint_url
        Addressable::URI.parse(TransparenciaBrasil.configuration.endpoint)
      end

      def get_entity(klass, path, params = {})
        objects_from_response(klass, request(:get, path, params))
      end

      def objects_from_response(klass, response)
        result = JSON.parse(response.body_str, symbolize_names: true)
        if result.is_a?(Array)
          result.map { |body| klass.new body }
        else
          klass.new(result)
        end
      end

      def request(method, path, params={}, signature_params=params)
        url = endpoint_url.join("/api/"+path)

        connection = connection_builder(method, url, params)
        #case connection.response_code
        #when 400; raise TransparenciaBrasil::Error::BadRequest, ""
        #when 401; raise TransparenciaBrasil::Error::Unauthorized, ""
        #when 404; raise TransparenciaBrasil::Error::Unauthorized, ""
        #when 413; raise TransparenciaBrasil::Error::Unauthorized, ""
        #when 422; raise TransparenciaBrasil::Error::Unauthorized, ""
        #when 429; raise TransparenciaBrasil::Error::Unauthorized, ""
        #when 500; raise TransparenciaBrasil::Error::Unauthorized, ""
        #end

        connection
      rescue Curl::Err::ConnectionFailedError
        raise TransparenciaBrasil::Error::ServerError, ""
      end

      def connection_builder(method, url, params)
        request_setup = Proc.new { |config| config.verbose = ENV['DEBUG'] }

        connection = case method
                     when :get
                       url.query = params.to_query unless params.empty?
                       Curl.http :GET, url, nil, nil, &request_setup
                     else
                       raise "No support method #{method}"
                     end

      end
    end
  end
end

require 'transparencia_brasil/client/excelencia'
