module BookExtensions
  refine Book do
    def title
      super + " I'm refined from BookExtensions"
    end

    def this_method_is_called_here
      "HERE! HERE!"
    end
  end
end