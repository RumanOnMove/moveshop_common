module MoveshopCommon
  class PropertySerializer
    include JSONAPI::Serializer
    attributes :name, :presentation, :filterable, :filter_param
  end
end
