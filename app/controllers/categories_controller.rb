class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :confirm, :destroy]

    def index
        @categories = Category.latest.page(params[:page])
    end

    def show
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

    def edit
    end

    def update
        if @category.update(cat_params)
            flash[:success] = 'تم تعديل الفئه بنجاح.'
            redirect_to categories_path
        else
            render :edit
        end
    end

    def confirm
    end

    def destroy
        @category.destroy
        flash['success'] = 'تم حذف الفئه بنجاح'
        redirect_to categories_path
    end

    private
    def cat_params
        params.require(:category).permit(:name, :code, :description, :image)
    end

    def set_category
        @category = Category.find(params[:id])
    end
end
