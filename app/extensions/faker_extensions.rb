module FakerExtensions
  refine Faker::Book.singleton_class do
    def title
      "I'm refined"
    end
  end
end