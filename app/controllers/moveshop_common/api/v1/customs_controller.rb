module MoveshopCommon
  class Api::V1::CustomsController < ApplicationController
    def index
      render json: {message: 'hello world'}, status: :ok
    end
  end
end
