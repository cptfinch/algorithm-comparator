class BeamsController < ApplicationController
  # GET /beams
  # GET /beams.xml
  def index
    @beams = Beam.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @beams }
    end
  end

  # GET /beams/1
  # GET /beams/1.xml
  def show
    @beam = Beam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @beam }
    end
  end

  # GET /beams/new
  # GET /beams/new.xml
  def new
    @beam = Beam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @beam }
    end
  end

  # GET /beams/1/edit
  def edit
    @beam = Beam.find(params[:id])
  end

  # POST /beams
  # POST /beams.xml
  def create
    @beam = Beam.new(params[:beam])

    respond_to do |format|
      if @beam.save
        flash[:notice] = 'Beam was successfully created.'
        format.html { redirect_to(@beam) }
        format.xml  { render :xml => @beam, :status => :created, :location => @beam }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @beam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /beams/1
  # PUT /beams/1.xml
  def update
    @beam = Beam.find(params[:id])

    respond_to do |format|
      if @beam.update_attributes(params[:beam])
        flash[:notice] = 'Beam was successfully updated.'
        format.html { redirect_to(@beam) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @beam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /beams/1
  # DELETE /beams/1.xml
  def destroy
    @beam = Beam.find(params[:id])
    @beam.destroy

    respond_to do |format|
      format.html { redirect_to(beams_url) }
      format.xml  { head :ok }
    end
  end
end
