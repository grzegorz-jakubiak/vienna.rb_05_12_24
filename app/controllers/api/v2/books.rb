module API
  module V2
    class Books < Grape::API
        resource :books do
          desc "Returns a book"

          route_param :id do
            get do
              book = Book.find_by(id: params[:id])
              error!(:im_a_teapot, 418) if book.nil?

              present book.attributes
              present :title, book.title
            end

            using BookExtensions

            get :details do
              book = Book.find_by(id: params[:id])
              error!(:im_a_teapot, 418) if book.nil?

              present book.attributes
              present :title, book.title
              present :id, book.this_method_is_called_here
            end

            get :details_2 do
              book = Book.find_by(id: params[:id])
              error!(:im_a_teapot, 418) if book.nil?

              present book
            end
          end
        end
    end
  end
end
