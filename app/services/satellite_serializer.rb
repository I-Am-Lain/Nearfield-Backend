class SatelliteSerializer

    def initialize(satellite_object)
        @satellite = satellite_object
      end

      def to_serialized_json
        @satellite.to_json(:include => {
          :category => {:only => [:name]}
        }, :except => [:updated_at, :created_at])
      end

end
