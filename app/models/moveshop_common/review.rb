module MoveshopCommon
  class Review < ApplicationRecord
    belongs_to :spree_product, class_name: 'Spree::Product', foreign_key: 'spree_product_id'
  end
end
