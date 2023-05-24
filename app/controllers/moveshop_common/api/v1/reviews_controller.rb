module MoveshopCommon
  class Api::V1::ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    # List of Reviews
    def index
      reviews = Review.all
      render json: { data: reviews }, status: :ok
    end

    # Show Review
    def show
      review = Review.find_by(id: params[:id])
      if review
        render json: ReviewSerializer.new(review), message: 'Review retrieved successfully' , status: :ok
      else
        render json: { message: 'Review not found' }, status: :not_found
      end
    end

    # Create Review
    def create
      review_params = params.require(:review).permit(:product_id, :title, :description, :rating, :name, :email)
      review_params[:spree_product_id] = review_params.delete(:product_id) if review_params.key?(:product_id)

      review = Review.new(review_params)
      if review.save
        render json: { data: review, message: 'Review created successfully' }, status: :created
      else
        render json: { error: review.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    # Update Review
    def update
      review = Review.find_by(id: params[:id])

      if review.update(review_params)
        render json: { data: review, message: 'Review updated successfully' }, status: :ok
      else
        render json: { error: review.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    # Remove Review
    def destroy
      review = Review.find_by(id: params[:id])

      if review&.destroy
        render json: { message: 'Review deleted successfully' }, status: :ok
      else
        render json: { error: 'Review not found or could not be deleted' }, status: :unprocessable_entity
      end
    end

    private

    def review_params
      params.require(:review).permit(:spree_product_id, :title, :description, :rating, :name, :email)
    end
  end
end
