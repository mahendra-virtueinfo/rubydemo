class SolutionsController < ApplicationController
  def index
    @solutions = Solution.paginate(:per_page => 2, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @solutions }
    end
  end

  def new
    @solution = Solution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @solutions}
    end
  end

  def create
    @solution = Solution.new(params[:solution])

    respond_to do |format|
      if @solution.save
        format.html { redirect_to solutions_path, :notice => "Solution created successfully" }
        format.json { render :json => @solution, :status => "created", :location => @solution }
      else
        format.html { render :action => "new" }
        format.json { render :json => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.json { render :json => @solution }
    end
  end

  def update
    @solution = Solution.find(params[:id])

    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        format.html { redirect_to solutions_path, :notice => "Solution updated successfully" }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render :json => @solution }
    end
  end

  def destroy
     @solution = Solution.find(params[:id])
     @solution.destroy

     respond_to do |format|
       format.html { redirect_to solutions_path, :notice => "Record deleted successfully" }
       format.json { head :no_content }
     end
  end
end
