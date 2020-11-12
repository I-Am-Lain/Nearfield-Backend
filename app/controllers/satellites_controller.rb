class SatellitesController < ApplicationController


    def index
        satellites = Satellite.all
        render json: SatelliteSerializer.new(satellites).to_serialized_json
    end

    def show
        satellite = Satellite.find_by(id: params[:id])
        render json: SatelliteSerializer.new(satellite).to_serialized_json
    end

    def new
        satellite = Satellite.new
        render json: SatelliteSerializer.new(satellite).to_serialized_json
    end

    def create
        satellite = Satellite.create(satellite_params)
        render json: SatelliteSerializer.new(satellite).to_serialized_json
    end

    def update
        satellite = Satellite.find_by(id: params[:id])
        satellite.update
        render json: SatelliteSerializer.new(satellite).to_serialized_json
    end

    def destory
        satellite = Satellite.find(params[:id])
        satellite.delete

    end

    private

        def satellite_params
            params.require(:satellite).permit(:name, :color, :satellite_number, :international_designator, :owner, :category_id, :mission, :launch_date, :launch_site, :period, :perigree, :apogee, :inclination, :x_coor, :y_coor, :z_coor)
        end


end
