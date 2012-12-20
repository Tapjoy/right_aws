require 'em-synchrony'
require 'em-synchrony/em-http'

module Haxx
  def self.get_connection(request)
    # method access to hash keys
    def request.method_missing(m, *args, &block)
      if self.has_key?(m)
        self[m]
      else
        super(m, *args, &block)
      end
    end

    Connection.new
  end

  def self.destroy_connection(request, msg = '')
    # do nothing
  end

  class Connection
    def request(request)
      base_uri = "#{request[:protocol]}://#{request[:server]}:#{request[:port]}#{request[:path]}"

      do_request = lambda {
        @response = if request[:verb] == 'GET'
          # specs need this, library might too.  idk -KB
          request[:path] = "#{request[:path]}#{request[:data]}"
          EM::HttpRequest.new(
            "#{base_uri}?#{request[:data]}"
          ).get
        else
          EM::HttpRequest.new(
            "#{base_uri}"
          ).post(
            :head => {'Content-Type' => 'application/x-www-form-urlencoded; charset=utf-8'},
            :body => request[:data]
          )
        end
      }

      if EM.reactor_running?
        do_request.call
      else
        EM.synchrony { do_request.call; EM.stop }
      end

      Object.new.tap do |object|
        object.instance_variable_set(:@response, @response)

        def object.code
          @response.response_header.status
        end

        def object.message
          'ignored'
        end

        def object.body
          @response.response
        end

        def object.success?
          code >= 200 && code < 300
        end
      end
    end
  end
end

