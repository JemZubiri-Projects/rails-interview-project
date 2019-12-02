class Authenticator < ActionController::Base
    attr_accessor :api_key

    def initialize( options={} )
        if !options[:api_key].nil?
            @api_key      = options[:api_key]
		end
    end
end