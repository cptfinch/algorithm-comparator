class Patient < ActiveRecord::Base
  has_many :comparisons
end
