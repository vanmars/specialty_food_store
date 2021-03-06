class ProductsController < ApplicationController
  
  def index 
    @products = Product.all 
    @recent_products = Product.three_most_recent
    @most_reviewed_product = Product.most_reviewed
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create 
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created!"
      redirect_to products_path
    else
      flash[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to products_path
  end

  private 
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end