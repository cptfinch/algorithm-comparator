class ComparisonsController < ApplicationController
  # GET /comparisons
  # GET /comparisons.xml
  def index
    @comparisons = Comparison.find(:all)
    @result_data_link = formatted_result_reports_url(:xml)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comparisons }
    end
    
  end

  # GET /comparisons/1
  # GET /comparisons/1.xml
  def show
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comparison }
    end
  end

  # GET /comparisons/new
  # GET /comparisons/new.xml
  def new
    @comparison = Comparison.new   
    
#    @plans = [Plan.new,Plan.new] 
    
    @comparison_types = ComparisonType.find(:all)
    
    @patient = Patient.new
    
    @users=User.find(:all)
    
    #make 3 beams
    @beams = [1,2,3].map do |e|
      Beam.new(:number => e)
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comparison }
    end
  end
  
  # GET /comparisons/1/edit
  def edit  
    @comparison = Comparison.find(params[:id])
  end

  # POST /comparisons
  # POST /comparisons.xml
  def create
    @comparison = Comparison.new(params[:comparison])
    
#    @patient = Patient.new(params[:patient])
#    @comparison.patient = @patient
    
#    @plan1 = Plan.new
    
#    params[:beams1].each do |k,v|
#      @plan1.beams.build(v)
#    end
    
#    @plan2 = Plan.new
    
#    params[:beams2].each do |k,v|
#      @plan2.beams.build(v)
#    end
    
#    @comparison.plans << @plan1
#    @comparison.plans << @plan2
            
    respond_to do |format|
      if @comparison.save
        flash[:notice] = 'Comparison was successfully created.'
        format.html { redirect_to(@comparison) }
        format.xml  { render :xml => @comparison, :status => :created, :location => @comparison }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comparison.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comparisons/1
  # PUT /comparisons/1.xml
  def update
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      if @comparison.update_attributes(params[:comparison])
        flash[:notice] = 'Comparison was successfully updated.'
        format.html { redirect_to(@comparison) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comparison.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comparisons/1
  # DELETE /comparisons/1.xml
  def destroy
    @comparison = Comparison.find(params[:id])
    @comparison.destroy

    respond_to do |format|
      format.html { redirect_to(comparisons_url) }
      format.xml  { head :ok }
    end
  end
  
  #my extra non-REST methods

  # these two are for ajax calls  
  def get_algorithm_title
    @comp_type = ComparisonType.find(params[:comparison_type_id])
    render :partial => "get_algorithm_title"
  end
  
  def get_algorithm_title_again
    @comp_type = ComparisonType.find(params[:comparison_type_id])
    render :partial => "get_algorithm_title_again"
  end
  
end
