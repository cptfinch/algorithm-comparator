class ComparisonType < ActiveRecord::Base
  has_many :algorithm_comparison_joins
  has_many :algorithms, :through => :algorithm_comparison_joins
  has_many :comparisons
end
