module API
  module V1
    class VHS < Grape::API
        resource :vhs do
          desc "Returns a random name?"

          using FakerExtensions

          get :random_name do
            present :name, Faker::Book.title
          end
        end
    end
  end
end
