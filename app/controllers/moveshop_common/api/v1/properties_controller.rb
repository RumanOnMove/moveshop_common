module MoveshopCommon
  class Api::V1::PropertiesController < MoveshopCommon::AuthController
    skip_before_action :verify_authenticity_token, only: [:index, :show, :create, :update, :destroy]
    before_action :authorize_admin, only: [:index, :show, :create, :update, :destroy]

    # List of Spree Properties
    def index
      properties = Property.all

      render json: PropertySerializer.new(properties), status: :ok
    end

    # Show Spree Properties
    def show
      property = Property.find_by(id: params[:id])

      if property
        render json: PropertySerializer.new(property), message: 'Property retrieved successfully', status: :ok
      else
        render json: { message: 'Property not found' }, status: :not_found
      end
    end

    # Create new Spree Properties
    def create
      property_params[:filter_param] = property_params[:presentation].downcase

      property = Property.new(property_params)

      if property.save
        render json: PropertySerializer.new(property), message: 'Property created successfully', status: :created
      else
        render json: { error: property.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    # Update Spree Properties
    def update
      property_params[:filter_param] = property_params[:presentation].downcase
      property = Property.find_by(id: params[:id])

      if property.update(property_params)
        render json: PropertySerializer.new(property), message: 'Property updated successfully', status: :ok
      else
        render json: { error: property.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    # Remove Spree Properties
    def destroy
      property = Property.find_by(id: params[:id])

      if property&.destroy
        render json: { message: 'Property deleted successfully' }, status: :ok
      end
    end

    private

    def property_params
      params.require(:property).permit(:name, :presentation, :filterable, :filter_param)
    end
  end
end
