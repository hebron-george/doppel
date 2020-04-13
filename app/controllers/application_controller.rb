class ApplicationController < ActionController::API
  def hello_world
    render json: {message: "Hello World from the back end!"}, status: :ok
  end
end
