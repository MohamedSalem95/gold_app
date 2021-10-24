class ProductsController < ApplicationController

    before_action :authenticate_user!, except: [:home, :show_customer]
    before_action :set_cat, only: [:new, :create, :show, :edit, :update]
    before_action :set_product, only: [:show, :show_customer, :edit, :update]

    def list
        @products = Product.latest
    end

    def index
    end

    def show
    end

    def home
        @categories = Category.latest
        @latest_products = Product.latest_products
        @best_discount = Product.best_discount
    end

    def show_customer
        @product.increment!(:views)
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.category_code = @category.code
        @product.category = @category
        @product.sub_category = get_sub
        if @product.save
            flash[:success] = 'تم انشاء المنتج بنجاح'
            redirect_to products_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @product.update(product_params)
            flash[:success] = 'تم تعديل المنتج بنجاح.'
            redirect_to category_product_path(@category, @product)
        else
            render :edit
        end
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :code, :stock, :price, :discount, :gold_type, :sub_code)
    end

    def set_cat
        @category = Category.find(params[:category_id])
    end

    def get_sub
        sub_code = product_params['sub_code']
        SubCategory.find_by_code(sub_code)
    end

    def set_product
        @product = Product.find(params[:id])
    end

end
