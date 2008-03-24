class AlgorithmComparisonJoinsController < ApplicationController
  # GET /algorithm_comparison_joins
  # GET /algorithm_comparison_joins.xml
  def index
    @algorithm_comparison_joins = AlgorithmComparisonJoin.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @algorithm_comparison_joins }
    end
  end

  # GET /algorithm_comparison_joins/1
  # GET /algorithm_comparison_joins/1.xml
  def show
    @algorithm_comparison_join = AlgorithmComparisonJoin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @algorithm_comparison_join }
    end
  end

  # GET /algorithm_comparison_joins/new
  # GET /algorithm_comparison_joins/new.xml
  def new
    @algorithm_comparison_join = AlgorithmComparisonJoin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @algorithm_comparison_join }
    end
  end

  # GET /algorithm_comparison_joins/1/edit
  def edit
    @algorithm_comparison_join = AlgorithmComparisonJoin.find(params[:id])
  end

  # POST /algorithm_comparison_joins
  # POST /algorithm_comparison_joins.xml
  def create
    @algorithm_comparison_join = AlgorithmComparisonJoin.new(params[:algorithm_comparison_join])

    respond_to do |format|
      if @algorithm_comparison_join.save
        flash[:notice] = 'AlgorithmComparisonJoin was successfully created.'
        format.html { redirect_to(@algorithm_comparison_join) }
        format.xml  { render :xml => @algorithm_comparison_join, :status => :created, :location => @algorithm_comparison_join }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @algorithm_comparison_join.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /algorithm_comparison_joins/1
  # PUT /algorithm_comparison_joins/1.xml
  def update
    @algorithm_comparison_join = AlgorithmComparisonJoin.find(params[:id])

    respond_to do |format|
      if @algorithm_comparison_join.update_attributes(params[:algorithm_comparison_join])
        flash[:notice] = 'AlgorithmComparisonJoin was successfully updated.'
        format.html { redirect_to(@algorithm_comparison_join) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @algorithm_comparison_join.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /algorithm_comparison_joins/1
  # DELETE /algorithm_comparison_joins/1.xml
  def destroy
    @algorithm_comparison_join = AlgorithmComparisonJoin.find(params[:id])
    @algorithm_comparison_join.destroy

    respond_to do |format|
      format.html { redirect_to(algorithm_comparison_joins_url) }
      format.xml  { head :ok }
    end
  end
end
