class Condition < ActiveRecord::Base
  belongs_to :patient

  attr_accessible :name
end
