module ComparisonsHelper
  
  def in_or_out(compare)
    compare.in_tolerance? ? "IN" : "OUT"
  end
end
