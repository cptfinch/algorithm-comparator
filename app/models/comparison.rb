class Comparison < ActiveRecord::Base
  has_many :plans
  belongs_to :patient
  belongs_to :user
  belongs_to :comparison_type
   
  before_create :calculate_result
  
  def calculate_result
    self.result = max_difference
  end
  
  def percent_differences
    plan0_beam_values = get_beam_values_for_plan(0)
    plan1_beam_values = get_beam_values_for_plan(1)
    get_percent_diffs( plan0_beam_values, plan1_beam_values )
  end
  
  def tolerance
    self.comparison_type.tolerance
  end
  
  def max_difference
    percent_differences.max
  end
  
  def in_tolerance?
    max_difference < tolerance
  end
  
  def out_of_tolerance?
    max_difference > tolerance
  end
    
  def plan1=(plan_attributes)
    
    plan1 = Plan.new
    plan_attributes.each do |beam_attributes|
      plan1.beams.build(beam_attributes)
    end
    
    self.plans << plan1
      
  end

  def plan2=(plan_attributes)
    
    plan1 = Plan.new
    plan_attributes.each do |beam_attributes|
      plan1.beams.build(beam_attributes)
    end
    
    self.plans << plan1
      
  end
  
  private
    
    def get_percent_diffs(array1,array2)
      zipped_plan_values = array1.zip(array2)
      
      zipped_plan_values.map do |m|
        ((m[0]-m[1])/m[0])*100
      end
      
    end
    
    def get_beam_values_for_plan(plan_number)
      self.plans[plan_number].beams.map{|m| m.value}
    end
    
    def patient_attributes=(patient_attributes)
      self.patient = Patient.new(patient_attributes)
      
    end
end
