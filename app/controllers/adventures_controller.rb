class AdventuresController < ApplicationController

    def index
        @adventures = Adventure.all
    end

    def new
        @adventure = Adventure.new
    end

    def create
        @adventure = current_user.adventures.build(adventure_params)
        if @adventure.save
            redirect_to adventure_path(@adventure)
        else
            render 'new'
        end
        # adventure = Adventure.create(user_id: current_user.id, location_id: params[:location][:location_id])
    end

    def show
        @adventure = Adventure.find(params[:id])
    end

    def edit
        @adventure = Adventure.find(params[:id])
    end

    def update
        @adventure = Adventure.find(params[:id])
        @adventure.update(adventure_params)
        redirect_to adventure_path(@adventure)
    end

    def destroy
        @adventure = Adventure.find(params[:id])
        @adventure.destroy
        redirect_to adventures_path
    end


    private

    def adventure_params
        params.require(:adventure).permit(:user_id, :location_id, :name, :recommendation, :is_wishlist?)
    end

end
