class HomesController < ApplicationController
  def inbound_sms
    valid = InputValidator.new(["to", "from", "text"], params).call()
    render json: {errors: valid} if valid.any?
    unless @account.phone_numbers.where(number: params[:to]).any?
      render json: {error: "to parameter not found", message: "to parameter not found"}
    end
    if params[:text].strip == "Stop"
      # Store from and to in redis cache
    end
  end

  def outbound_sms
    valid = InputValidator.new(["to", "from", "text"], params).call()
    render json: {errors: valid} if valid.any?

    # - Using cache, do not allow more than 50 API requests using the same ‘from’ number in 24
    # hours from the first use of the ‘from’ number and reset counter after 24 hours. Return an
    # error in case of limit reached (see Output JSON response below).
    # - If the ‘from’ parameter is not present in the phone_number table for this specific account
    # you used for the basic authentication, return an error (see Output JSON response
    # below).
  end
end
