module API
  module V2
    class BookPages < Grape::API
      using GrapeSwaggerExtensions

      resource :book_pages do
        desc "Returns number of pages of all the books",
        success: [
          {type: 'Integer', as: :number_of_pages}
        ]

        get do
          present :number_of_pages, Book.pluck(:page).sum
        end
      end
    end
  end
end

# class Grape::Endpoint
#   def response_object(route, options)
#     codes(route).each_with_object({}) do |value, memo|
#       value[:message] ||= ""
#       memo[value[:code]] = { description: value[:message] ||= "" } unless memo[value[:code]].present?
#       memo[value[:code]][:headers] = value[:headers] if value[:headers]

#       next build_file_response(memo[value[:code]]) if file_response?(value[:model])

#       next build_delete_response(memo, value) if delete_response?(memo, route, value)
#       next build_response_for_type_parameter(memo, route, value, options) if value[:type]

#       # Explicitly request no model with { model: '' }
#       next if value[:model] == ""

#       response_model = value[:model] ? expose_params_from_model(value[:model]) : @item
#       next unless @definitions[response_model]
#       next if response_model.start_with?("Swagger_doc")

#       @definitions[response_model][:description] ||= "#{response_model} model"
#       build_memo_schema(memo, route, value, response_model, options)
#       memo[value[:code]][:examples] = value[:examples] if value[:examples]
#     end
#   end

#   private

#   def build_delete_response(memo, value)
#     memo[204] = memo.delete(200)
#     value[:code] = 204
#   end

#   def delete_response?(memo, route, value)
#     memo.key?(200) && route.request_method == "DELETE" && value[:model].nil?
#   end

#   def build_response_for_type_parameter(memo, _route, value, _options)
#     type, format = prepare_type_and_format(value)

#     if memo[value[:code]].include?(:schema) && value.include?(:as)
#       memo[value[:code]][:schema][:properties].merge!(value[:as] => { type: type, format: format }.compact)
#     elsif value.include?(:as)
#       memo[value[:code]][:schema] =
#         { type: :object, properties: { value[:as] => { type: type, format: format }.compact } }
#     else
#       memo[value[:code]][:schema] = { type: type }
#     end
#   end

#   def prepare_type_and_format(value)
#     data_type = GrapeSwagger::DocMethods::DataType.call(value[:type])

#     if GrapeSwagger::DocMethods::DataType.primitive?(data_type)
#       GrapeSwagger::DocMethods::DataType.mapping(data_type)
#     else
#       data_type
#     end
#   end

#   def success_code_from_entity(route, entity)
#     default_code = GrapeSwagger::DocMethods::StatusCodes.get[route.request_method.downcase.to_sym]
#     if entity.is_a?(Hash)
#       default_code[:code] = entity[:code] if entity[:code].present?
#       default_code[:model] = entity[:model] if entity[:model].present?
#       default_code[:message] = entity[:message] || route.description || default_code[:message].sub("{item}", @item)
#       default_code[:examples] = entity[:examples] if entity[:examples]
#       default_code[:headers] = entity[:headers] if entity[:headers]
#       default_code[:as] = entity[:as] if entity[:as]
#       default_code[:is_array] = entity[:is_array] if entity[:is_array]
#       default_code[:required] = entity[:required] if entity[:required]
#       default_code[:type] = entity[:type] if entity[:type]
#     else
#       default_code = GrapeSwagger::DocMethods::StatusCodes.get[route.request_method.downcase.to_sym]
#       default_code[:model] = entity if entity
#       default_code[:message] = route.description || default_code[:message].sub("{item}", @item)
#     end
#     default_code
#   end
# end
