class Admin::ProductImagesController < Admin::BaseController

  before_action :find_product

  def index
    @product_images = @product.product_images
  end

  def create
    unless (params[:images].nil?)
      params[:images].each do |image|
        @product.product_images << ProductImage.new(image: image)
      end

      redirect_to :back
    else
      flash[:warning] = "没有选中任何图片"
      redirect_to :back
    end
    
  end

  def destroy
    @product_image = @product.product_images.find(params[:id])
    if @product_image.destroy
      flash[:notice] = "删除成功"
    else
      flash[:notice] = "删除失败"
    end

    redirect_to :back
  end

  def update
    @product_image = @product.product_images.find(params[:id])
    @product_image.weight = params[:weight]
    if @product_image.save
      flash[:notice] = "修改成功"
    else
      flash[:notice] = "修改失败"
    end

    redirect_to :back
  end

  private
  def find_product
    @product = Product.find params[:product_id]
  end

end