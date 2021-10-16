class ProductsController < ApplicationController

    def index
        @products = Product.latest
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.category = get_cat
        if @product.save
            flash[:success] = 'تم انشاء المنتج بنجاح'
            redirect_to products_path
        else
            render :new
        end
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :code, :stock, :price, :discount, :gold_type, :category_code)
    end

    def get_cat
        cat_code = product_params['category_code']
        Category.find_by_code(cat_code)
    end

end
