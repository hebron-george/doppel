class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  def hello_world
    render json: {message: "Hello World from the back end!"}, status: :ok
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized'}, status: :unauthorized unless @current_user
  end
end
