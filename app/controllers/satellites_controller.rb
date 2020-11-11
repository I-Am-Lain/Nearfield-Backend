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

    def delete
        satellite = Satellite.find_by(id: params[:id])
        satellite.delete
    end



end
