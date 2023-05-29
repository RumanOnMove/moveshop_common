module MoveshopCommon
  class ReviewSerializer
    include JSONAPI::Serializer

    attributes  :product_id, :title, :description, :rating, :name, :email
  end
end
