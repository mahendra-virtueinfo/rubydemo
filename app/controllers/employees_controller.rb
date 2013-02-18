class EmployeesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @employees = Employee.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 4)
  end
  def new
    @employee = Employee.new
    @employee.build_picture
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @employee }
    end
  end

  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, :notice => "Employee created successfully" }
        format.json { head :no_content }
      else
        format.html {  render :action => "new" }
        format.json { render :json => @employee.errors , :location => :unprocessable_entity}
      end
    end
  end

  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @employee }
    end
  end
  def sort_column
    Employee.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
