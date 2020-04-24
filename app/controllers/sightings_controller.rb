class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        
        if sighting 
            render json: sighting, include: [:bird, :location], except: [:updated_at]
            # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
        else 
            render json: {message: "No such sighting found"}
        end
        
    end
end
