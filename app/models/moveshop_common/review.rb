module MoveshopCommon
  class Review < ApplicationRecord
    belongs_to :spree_product, class_name: 'Spree::Product', foreign_key: 'spree_product_id'

    validates :title, presence: true, length: { maximum: 55 }
    validates :description, presence: true, length: { maximum: 255 }
    validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 5.0, message: 'must be a decimal number between 1.00 and 5.00' }
    validates :name, presence: true, length: { maximum: 55 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    attr_reader :product_id
    # Getter
    def product_id
      self.spree_product_id
    end
  end
end
