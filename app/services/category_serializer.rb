class CategorySerializer

    def initialize(category_object)
        @category = category_object
      end

      def to_serialized_json
        @category.to_json(:include => {
          :satellites => {:only => [:name]}
        }, :only => [:name])
      end

end
