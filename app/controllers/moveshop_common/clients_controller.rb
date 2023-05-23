module MoveshopCommon
  class ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    def index
      clients = Client.all
      render json: { data: clients }, status: :ok
    end

    def show
      client = Client.find_by(id: params[:id])

      if client
        render json: { data: client, message: 'Client retrieved successfully' }, status: :ok
      else
        render json: { message: 'Client not found' }, status: :not_found
      end
    end

    def create
      client = Client.new(client_params)

      if client.save
        render json: { data: client, message: 'Client created successfully' }, status: :created
      else
        render json: { error: client.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }
    end

    def update
      client = Client.find_by(id: params[:id])

      if client.update(client_params)
        render json: { data: client, message: 'Client updated successfully' }, status: :ok
      else
        render json: { error: client.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }
    end

    def destroy
      client = Client.find_by(id: params[:id])

      if client&.destroy
        render json: { message: 'Client deleted successfully' }, status: :ok
      else
        render json: { error: 'Client not found or could not be deleted' }, status: :unprocessable_entity
      end
    end

    private

    def client_params
      params.require(:client).permit(:name, :scopes)
    end
  end
end
