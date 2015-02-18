module Api
  class ApiController < ActionController::Base
    respond_to :json
    #before_action :authenticate
    
    private 
    
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
  end
end
