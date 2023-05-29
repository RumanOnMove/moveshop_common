module MoveshopCommon
  class Property < Spree::Property
    validates :name, presence: true, length: { maximum: 55 }, uniqueness: true
    validates :presentation, presence: true, length: { maximum: 55 }, uniqueness: false
  end
end
