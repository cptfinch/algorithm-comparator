class ReportsController < ApplicationController
  
  def result
    @comparisons = Comparison.find(:all)
    @result_data_link = formatted_result_reports_url(:xml)
    respond_to do |format|
      format.html
      format.xml  { render :action => "result.xml.builder", :layout => false }
    end
  end
  
end
