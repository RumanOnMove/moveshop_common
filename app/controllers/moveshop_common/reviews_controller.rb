module MoveshopCommon
  class ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    def index
      reviews = Review.all
      render json: { data: reviews }, status: :ok
    end

    def show
    end

    def create
      review = Review.new(review_params)
      if review.save
        render json: { data: review, message: 'Review created successfully' }, status: :created
      else
        render json: { error: review.errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    def update

    end

    def destroy

    end

    private

    def review_params
      params.require(:review).permit(:spree_product_id, :title, :description, :rating, :name, :email)
    end
  end
end
