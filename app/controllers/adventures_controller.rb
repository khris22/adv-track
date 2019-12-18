class AdventuresController < ApplicationController
    before_action :authenticate_user 
    before_action :set_adventure, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_wrong_user, only: [:edit, :update, :destroy]

    def index
            @wishlists = current_user.adventures.is_wishlist #scope
        if set_location
            @adventures = @location.adventures.adventure_done #scope
        else
            @adventures = current_user.adventures.adventure_done
        end
    end

    def new
        #nested
        if set_location
            @adventure = @location.adventures.build #building nested route .build for has_many
        else #not nested
            @adventure = Adventure.new
            @adventure.build_location #bec of belongs_to, will return nil if the adventure has no location
        end
    end

    def create
        #nested
        if current_user && @location = Location.find_by(id: params[:adventure][:location_id])
            @adventure = @location.adventures.build(adventure_params)
            @adventure.user = current_user
            if @adventure.save
                redirect_to location_adventure_path(@adventure.location, @adventure)
            else

                render 'new'
            end
        else #not nested   
            @adventure = current_user.adventures.build(adventure_params)
            if @adventure.save
                redirect_to adventure_path(@adventure)
            else
                render 'new'
            end
        end
    end

    def show
        if !@adventure 
            redirect_to adventures_path
        end
    end

    def edit
    end

    def update
        @adventure.update(adventure_params)
        flash[:notice] = "You have successfully updated your adventure entry!"
        redirect_to adventure_path(@adventure)
    end

    def destroy
        @adventure.destroy
        flash[:notice] = "You have successfully deleted your adventure entry!"
        redirect_to adventures_path
    end


    private

    def set_location
        params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
    end

    def set_adventure
        @adventure = Adventure.find_by_id(params[:id]) 
        
    end

    def redirect_if_wrong_user
        if current_user != @adventure.user
            flash[:error] = "You are not authorized to edit ot delete this adventure!"
            redirect_to adventures_path
        end
    end

    def adventure_params
        params.require(:adventure).permit(:user_id, :location_id, :name, :recommendation, :is_wishlist, location_attributes: [:city, :state, :id])
    end

end
