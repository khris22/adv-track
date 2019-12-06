class AdventuresController < ApplicationController
    def create
        adventure = Adventure.create(user_id: current_user.id, location_id: params[:location][:location_id])
    end

    def show
        @adventure = Adventure.find(params[:id])
    end

    private

    def adventure_params
        params.require(:adventure).permit(:user_id, :location_id, :name, :recommendation, :is_wishlist?)
    end

end
