class ComparisonTypesController < ApplicationController
  # GET /comparison_types
  # GET /comparison_types.xml
  def index
    @comparison_types = ComparisonType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comparison_types }
    end
  end

  # GET /comparison_types/1
  # GET /comparison_types/1.xml
  def show
    @comparison_type = ComparisonType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comparison_type }
    end
  end

  # GET /comparison_types/new
  # GET /comparison_types/new.xml
  def new
    @comparison_type = ComparisonType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comparison_type }
    end
  end

  # GET /comparison_types/1/edit
  def edit
    @comparison_type = ComparisonType.find(params[:id])
  end

  # POST /comparison_types
  # POST /comparison_types.xml
  def create
    @comparison_type = ComparisonType.new(params[:comparison_type])

    respond_to do |format|
      if @comparison_type.save
        flash[:notice] = 'ComparisonType was successfully created.'
        format.html { redirect_to(@comparison_type) }
        format.xml  { render :xml => @comparison_type, :status => :created, :location => @comparison_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comparison_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comparison_types/1
  # PUT /comparison_types/1.xml
  def update
    @comparison_type = ComparisonType.find(params[:id])

    respond_to do |format|
      if @comparison_type.update_attributes(params[:comparison_type])
        flash[:notice] = 'ComparisonType was successfully updated.'
        format.html { redirect_to(@comparison_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comparison_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comparison_types/1
  # DELETE /comparison_types/1.xml
  def destroy
    @comparison_type = ComparisonType.find(params[:id])
    @comparison_type.destroy

    respond_to do |format|
      format.html { redirect_to(comparison_types_url) }
      format.xml  { head :ok }
    end
  end
end
