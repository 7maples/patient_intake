class Patient < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  validates_presence_of :first_name, :last_name
  has_many :conditions

  serialize :responses, ActiveRecord::Coders::Hstore

  def name
    [first_name, last_name].join " "
  end

  %w[mobile_phone age sex weight allergies conditions symptoms].each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("responses @> hstore(?, ?)", key, value) }

    define_method(key) do
      responses && responses[key]
    end

    define_method("#{key}=") do |value|
      self.responses = (responses || {}).merge(key => value)
    end
  end
end
