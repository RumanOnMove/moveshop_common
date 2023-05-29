# frozen_string_literal: true
module MoveshopCommon
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_mounting_line
        # This is MoveshopCommon package default route
        route "# This is MoveshopCommon package default route \nmount MoveshopCommon::Engine, at: '/'"
      end
    end
  end
end

