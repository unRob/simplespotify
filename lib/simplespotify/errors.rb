module SimpleSpotify
  module Error

    def self.for status_code
      case status_code
        when 401 then Unauthorized
        when 404 then NotFound
        when 429 then RateLimited
        when (500..599) then API
        else
          DefaultError
      end
    end


    class AuthorizationError < StandardError
      attr_reader :message
      def initialize body
        @message = body[:error_description]
      end
    end


    class DefaultError < StandardError
      attr_reader :code, :body, :message, :request
      def initialize code, body, request
        @code = code
        @body = body
        @request = request
        @message = body[:error][:message] unless body.nil?
      end
    end

    class BadResponse < StandardError
      attr_reader :code, :message, :request, :body
      def initialize code, body, request
        @code = code
        @message = 'Unreadable JSON data returned from SimpleSpotify API'
        @request = request
        @body = body
      end
    end

    class API < DefaultError
    end

    class NotFound < DefaultError
      def initialize code, body, request
        @message = "#{request.full_url} not found"
      end
    end

    class Unauthorized < DefaultError
    end

    class RateLimited < DefaultError
    end

  end
end