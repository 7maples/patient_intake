class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  def name
    [first_name, last_name].join " "
  end


end
