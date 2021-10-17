class ImagesController < ApplicationController
    before_action :set_product, only: [:new, :create]

    def new
        @image = Image.new
    end

    def create
        @image = Image.new(image_params)
        @image.product = @product
        if @image.save
            flash[:success] = 'تم حفظ الصوره بنجاح'
            redirect_to category_product_path(@product.category, @product)
        else
            render :new
        end
    end

    private
    def set_product
        @product = Product.find(params[:product_id])
    end

    def image_params
        params.require(:image).permit(:caption, :image)
    end

end
