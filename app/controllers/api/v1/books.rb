module API
  module V1
    class Books < Grape::API
        resource :books do
          desc "Returns a random name?"

          get :random_name do
            present :name, Faker::Book.title
          end
        end
    end
  end
end

module Faker
  class Book < Base
    class << self
      def title
        "Whatever do you mean?"
      end
    end
  end
end
