module MoveshopCommon
  class Api::V1::ClientsController < MoveshopCommon::AuthController

    before_action :authorize_admin, only: [:index, :create, :update, :destroy]

    # List of OAuthClient
    def index
      clients = Client.all
      render json: { data: clients }, status: :ok
    end

    # Show OAuthClient
    def show
      client = Client.find_by(id: params[:id])

      if client
        data = {
          name: client.name,
          uid: client.uid,
          secret: client.secret,
          created_at: client.created_at,
          updated_at: client.updated_at
        }
        render json: { client: data, message: 'Client retrieved successfully' }, status: :ok
      else
        render json: { message: 'Client not found' }, status: :not_found
      end
    end

    # Create new OAuthClient
    def create
      client = Client.new(client_params)

      if client.save
        render json: { data: client, message: 'Client created successfully' }, status: :created
      else
        render json: { error: client.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    # Update OAuthClient
    def update
      client = Client.find_by(id: params[:id])

      if client.update(client_params)
        render json: { data: client, message: 'Client updated successfully' }, status: :ok
      else
        render json: { error: client.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    # Remove OAuthClient
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
