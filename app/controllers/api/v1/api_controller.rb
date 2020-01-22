class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_errors

  private
 
  def not_found_errors
    render json: 'Not Found', status: :not_found
  end
end