class AnimalsController < ApplicationController

    def index
        animals = Animal.all
        #sightings = Sighting.all
        render json: @animals
    end

    def show
        animal = Animal.find(params[:id])
        #@seen_anim = Sighting.new
        render :json => animal.to_json(:include => :sightings)
    end

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            #render json: animal.errors
            render json: 'validation_errors', :status => 422
        end
    end

    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else
            render json: errors
        end
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params) 
        if animal.valid?
            render json: animal
        else
            #render json: animal.errors
            render json: 'validation_errors', :status => 422
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom, sightings_attributes:[:id, :start_time, :action])
    end

end
