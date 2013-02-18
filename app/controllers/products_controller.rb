class ProductsController < ApplicationController
  def new
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product}
    end
  end

  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to new_product_path, :notice => "Product created successfully" }
        format.json { head :no_content }
      else
        format.html {  render :action => "new" }
        format.json { render :json => @product.errors , :status => :unprocessable_entity}
      end
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end
end
