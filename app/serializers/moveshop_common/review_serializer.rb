module MoveshopCommon
  class ReviewSerializer
    include JSONAPI::Serializer

    attribute :spree_product_id, key: :product_id

    attributes :title, :description, :name, :email
  end
end
