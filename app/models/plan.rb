class Plan < ActiveRecord::Base
  belongs_to :comparison
  has_many :beams
  belongs_to :algorithm

  def assign_beams
    [1,2,3].each do |e|
      self.beams.build(:number => e)
    end
    self
  end
  
end
