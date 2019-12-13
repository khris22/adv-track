class AdventuresController < ApplicationController
    before_action :authenticate_user 
    before_action :set_adventure, :redirect_if_wrong_user, only: [:edit, :update, :destroy]
    

    def index
        @wishlists = current_user.adventures.is_wishlist #scope method
        if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
            @adventures = @location.adventures.adventure_done #scope method
        else
            @adventures = current_user.adventures.adventure_done
        end
    end

    def new
        #nested
        if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
            @adventure = @location.adventures.build #building nested route .build for has_many
        else #not nested
            @adventure = Adventure.new
            @adventure.build_location #bec of belongs_to, will return nil if the adventure has no location
        end
    end

    def create
        # binding.pry
        #nested
        # if current_user && @location = Location.find_by(id: params[:adventure][:location_id])
        #     @adventure = @location.adventures.build(adventure_params)
        #     if @adventure.save
        #         redirect_to location_adventure_path(@adventure)
        #     end
        # else     
            # @location = Location.find_by(id: params[:adventure][:location_id])
            @adventure = current_user.adventures.build(adventure_params)
            # @adventure.location_id = params[:adventure][:location_id]
            # binding.pry
            # @adventure.user = current_user
            # @location.adventures = @adventure
            # binding.pry
            if @adventure.save
                redirect_to adventure_path(@adventure)
                # byebug
                # redirect_to location_adventure_path(@adventure.location)
                # redirect_to location_adventure_path(@adventure.location, @adventure)
            else
                render 'new'
            end
        # adventure = Adventure.create(user_id: current_user.id, location_id: params[:location][:location_id])
        # end
    end

    def show
        /locations/
        # binding.pry
        # if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
        #     @adventure = @location.adventures.find_by(id: params[:id])
        # else
            set_adventure
        # end
    end

    def edit
        set_adventure
    end

    def update
        set_adventure
        @adventure.update(adventure_params)
        redirect_to adventure_path(@adventure)
    end

    def destroy
        set_adventure
        @adventure.destroy
        redirect_to adventures_path
    end


    private

    def set_adventure
        @adventure = Adventure.find(params[:id])
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
