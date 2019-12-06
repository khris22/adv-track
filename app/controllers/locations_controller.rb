class LocationsController < ApplicationController

    def index
        @locations = Location.all
    end

    def new
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        if @location.save
            redirect_to location_path(@location)
        else
            render 'new'
        end
    end

    def show
        @location = Location.find_by(id: params[:id])
    end

    def edit
        @location = Location.find_by(id: params[:id])
    end

    def update
        @location = Location.find_by(id: params[:id])
        @location.update(location_params)
        redirect_to location_path(@location)
    end


    private

    def location_params
        params.require(:location).permit(:city, :state, :description)
    end

end
