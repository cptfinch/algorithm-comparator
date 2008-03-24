xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.chart do
  # xml.message "You can broadcast any message to chart from data XML file", :bg_color => "#FFFFFF", :text_color => "#000000"
  xml.series do    
    @comparisons.each_with_index do |comparison, index|
      xml.value comparison.created_at.to_date, :xid => index
    end
  end
  xml.graphs do
   #the gid is used in the settings file to set different settings just for this graph
    xml.graph :gid => 1 do
      @comparisons.each_with_index do |comparison, index|
        result = comparison.result
        if result >comparison.tolerance
          # When the population is > 1 million, show the bar in red/pink
          xml.value result, :xid => index, :color => "#444444", :gradient_fill_colors => "#444444,#000055", :description => comparison.created_at.to_date
        else
          xml.value result, :xid => index, :color => "#444444", :gradient_fill_colors => "#444444,#000000", :description => comparison.created_at.to_date
        end
      end
    end
  end
end