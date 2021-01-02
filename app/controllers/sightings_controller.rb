class SightingsController < ApplicationController

    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        #sightings = Sighting.all
        render json: sightings
    end

    def show
        sighting = Sighting.find(params[:id])
        render json: sighting
    end

    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
       # @seen_anim = sighting
    end

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: errors
        end
    end

    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params) 
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end


    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude, :start_date, :end_date, :action)
    end

end
