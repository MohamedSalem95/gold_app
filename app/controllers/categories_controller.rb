class CategoriesController < ApplicationController
    def index
        @categories = Category.latest
    end

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(cat_params)
        if @category.save
            flash[:success] = 'تم انشاء الفئه بنجاح 🤩'
            redirect_to categories_path
        else
            render :new
        end

    end

    private
    def cat_params
        params.require(:category).permit(:name, :code, :description, :image)
    end
end
