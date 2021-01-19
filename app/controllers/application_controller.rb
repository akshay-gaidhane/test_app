class ApplicationController < ActionController::API
  before_action :authenticate

  private
    
    def authenticate
      @account = Account.find_by(username: params[:username], auth_id: params[:password])
      unless @account
        render json: {status: 403, message: "Forbidden"}
      end

      # if user = authenticate_with_http_basic { |u, p| @account.users.authenticate(u, p) }
      #     @current_user = user
      #   else
      #     request_http_basic_authentication
      #   end
    end
end
