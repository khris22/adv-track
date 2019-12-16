class CategoriesController < ApplicationController
    def new
        Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to category_path(@category)
        else
            render 'new'
        end
    end

    private
    
    def category_params
        params.require(:category).permit(:adv_type)
    end
end
