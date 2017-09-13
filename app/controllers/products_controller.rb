class ProductsController < ApplicationController

  before_action :logged_in_user?, only: [:new, :create, :edit, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.create(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render 'new'
    end
  end

  def edit
    find_product
  end

  def destroy
    find_product
    @user_id = @product.user.id
    @product.destroy
    flash[:notice] = 'Item was deleted!'
    redirect_to user_path(@user_id)
  end

  def index
    @products = Product.all
  end

  def show
    find_product
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :category, :price, :image_url)
    end

    def find_product
      @product = Product.find(params[:id])
    end


end
