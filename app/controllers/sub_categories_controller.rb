class SubCategoriesController < ApplicationController
    before_action :set_cat, only: [:new, :create, :edit, :update, :confirm, :destroy, :index, :show]
    before_action :set_sub, only: [:edit, :update, :confirm, :destroy, :show]

    def new
        @sub_category = SubCategory.new
    end

    def index
        @sub_categories = @category.sub_categories
    end

    def show
        @products = @sub_category.products.latest.page(params[:page])
    end

    def create
        @sub_category = SubCategory.new(sub_cat_params)
        @sub_category.category = @category
        if @sub_category.save
            flash[:success] = 'تم انشاء الفئه الفرعيه بنجاح.'
            redirect_to category_path(@category)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @sub_category.update(sub_cat_params)
            flash[:success] = 'تم تعديل الفئه بنجاح.'
            redirect_to category_path @category
        else
            render :edit
        end
    end

    def confirm
    end

    def destroy
        @sub_category.destroy
        flash[:success] = 'تم حذف الفئه الفرعيه بنجاح.'
        redirect_to category_path(@category)
    end

    private
    def set_cat
        @category = Category.find(params[:category_id])
    end

    def set_sub
        @sub_category = SubCategory.find(params[:id])
    end

    def sub_cat_params
        params.require(:sub_category).permit(:name, :code, :image)
    end

end
