class SpicesController < ApplicationController
    def index
        spice = Spice.all
        render json: spice
    end

    def show
        spice = Spice.find_by(id: params[:id])
        render json: spice
    end
    
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update.(spice_params)
            render json: spice
        else
            render json: {update: "spice not found"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find(params[:id])
        if spice
            spice.destroy
        else
            render json: {delete: "spice not found"}, status: :not_found
        end
    end


    # custom methods

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
