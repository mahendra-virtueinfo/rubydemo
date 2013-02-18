class BooksController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /book
  # GET /book.json
  def index
    @books = Books.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 4)
  end

  # GET /book/1
  # GET /book/1.json
  def show
    @books = Books.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @books }
    end
  end

  # GET /book/new
  # GET /book/new.json
  def new
    @books = Books.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @books }
    end
  end

  # GET /book/1/edit
  def edit
    @books = Books.find(params[:id])
  end

  # POST /book
  # POST /book.json
  def create
    @books = Books.new(params[:books])

    respond_to do |format|
      if @books.save
        format.html { redirect_to @books, :notice => 'Book was successfully created.' }
        format.json { render :json => @books, :status => :created, :location => @books }
      else
        format.html { render :action => "new" }
        format.json { render :json => @books.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /book/1
  # PUT /book/1.json
  def update
    @books = Books.find(params[:id])

    respond_to do |format|
      if @books.update_attributes(params[:book])
        format.html { redirect_to @books, :notice => 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @books.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /book/1
  # DELETE /book/1.json
  def destroy
    @books = Books.find(params[:id])
    @books.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.js   { render :nothing => true }
    end
  end

  private

  def sort_column
    Books.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
