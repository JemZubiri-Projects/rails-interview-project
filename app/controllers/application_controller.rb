class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def valid_tenant
    authenticator = Authenticator.new(api_key: request.headers['HTTP_API_KEY'])
    if !authenticator.api_key.nil?
      @current_tenant = Tenant.find_by_api_key authenticator.api_key
      if @current_tenant.present?
        @current_tenant
      else
        render json:{message: "Invalid API key"}, status: 401
      end
    else
      render json:{message: "Unauthorized"}, status: 401
      return false
    end
  end
end
