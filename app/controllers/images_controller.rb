class ImagesController < ApplicationController
    before_action :set_product, only: [:new, :create, :confirm, :destroy]
    before_action :set_image, only: [:confirm, :destroy]

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

    def confirm
    end

    def destroy
        @image.destroy
        flash[:success] = 'تم حذف الصوره بنجاح.'
        redirect_to category_product_path(@product.category, @product)
    end

    private
    def set_product
        @product = Product.find(params[:product_id])
    end

    def set_image
        @image = Image.find(params[:id])
    end

    def image_params
        params.require(:image).permit(:caption, :image)
    end

end
