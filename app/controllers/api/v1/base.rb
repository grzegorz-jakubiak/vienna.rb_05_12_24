module API
  module V1
    class Base < Grape::API
      version "v1", using: :path

      mount API::V1::Books
      mount API::V1::VHS
    end
  end
end
