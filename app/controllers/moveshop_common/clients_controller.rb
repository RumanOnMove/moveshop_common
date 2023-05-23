module MoveshopCommon
  class ClientsController < ApplicationController
    def index
      clients = Spree::OauthApplication.all
      render json: { data: clients }, status: :ok
    end

    def show
      client = Spree::OauthApplication.find_by(id: params[:id])

      if client
        render json: { data: client, message: 'Client retrieved successfully' }, status: :ok
      end
    end

    def create
      client = Spree::OauthApplication.new(client_params)

      if client.save
        render json: { data: client, message: 'Client created successfully' }, status: :created
      end
    end

    def update
      client = Spree::OauthApplication.find_by(id: params[:id])

      if client.update(client_params)
        render json: { data: client, message: 'Client updated successfully' }, status: :ok
      else
        render json: { error: client.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }
    end

    def destroy
      client = Spree::OauthApplication.find_by(id: params[:id])

      if client&.destroy
        render json: { message: 'Client deleted successfully' }, status: :ok
      else
        render json: { error: 'Client not found or could not be deleted' }, status: :unprocessable_entity
      end
    end

    private

    def client_params
      params.permit(:name, :scopes)
    end
  end
end
