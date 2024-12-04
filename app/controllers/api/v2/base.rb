module API
  module V2
    class Base < Grape::API
      version "v2", using: :path

      mount API::V2::Books
      mount API::V2::BookPages
    end
  end
end
