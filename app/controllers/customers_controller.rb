class CustomersController < ApplicationController
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @customers }
    end
  end

  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @customer }
    end
  end

  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, :notice => "Customer has been created successfully" }
        format.json { head :no_content}
      else
        format.html { render :action => "new" }
        format.json { render :json => @customer.erros, :location => :unprocessable_entity }
      end
    end
  end

  def edit
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.json {render :json => @customer }
    end
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to customers_path, :notice => "Record has been updated successfully" }
        format.json { head :no_content}
      else
        format.html { render :action => "edit" }
        format.json { render :json => @customer.erros , :location => :unprocessable_entity }
      end
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_path, :notice => "Record deleted successfully" }
      format.json { head :no_content }
    end
  end
end
