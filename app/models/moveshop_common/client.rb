module MoveshopCommon
  class Client < Spree::OauthApplication
    validates :name, presence: true, length: { minimum: 5, maximum: 25 }, uniqueness: true
    validates :scopes, presence: true

    def self.scopes
      [
        { name: 'read_products', description: 'Read products' },
        { name: 'write_products', description: 'Write products' },
        { name: 'read_orders', description: 'Read orders' },
        { name: 'write_orders', description: 'Write orders' }
      # Add more scopes as needed
      ]
    end

    def scopes_enum
      self.class.scopes.map { |scope| [scope[:description], scope[:name]] }
    end
  end
end
