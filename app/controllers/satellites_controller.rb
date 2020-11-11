class SatellitesController < ApplicationController


    def index
        satellites = Satellite.all
        render json: satellites
    end

    def show
        satellite = Satellite.find_by(id: params[:id])
        render json: satellite
    end

    def new
        satellite = Satellite.new
        render json: satellite
    end

    def create
        satellite = Satellite.create(satellite_params)
        render json: satellite
    end

    def update
        satellite = Satellite.find_by(id: params[:id])
        satellite.update
        render json: satellite
    end

    def delete
        satellite = Satellite.find_by(id: params[:id])
        satellite.delete
    end



end
