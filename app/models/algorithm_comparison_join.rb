class AlgorithmComparisonJoin < ActiveRecord::Base
  has_many :algorithms
  has_many :comparison_types
end
