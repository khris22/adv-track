class AdventuresController < ApplicationController
    before_action :authenticate_user

    def index
        # @adventure = Adventure.find(params[:id])
        # @location = Location.find_by(id: params[:id])
        if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
            @adventures = @location.adventures
        else
            @adventures = Adventure.all
        end
    end

    def new
        #nested
        if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
            @adventure = @location.adventures.build #building nested route
        else #not nested
            @adventure = Adventure.new
        end
    end

    def create
        # @location = Location.find_by_id(params[:location_id])
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
        # @user = User.find_by(id: params[:id])
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
