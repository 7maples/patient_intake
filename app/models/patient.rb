class Patient < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates_presence_of :first_name, :last_name
  has_many :conditions

  serialize :responses, ActiveRecord::Coders::Hstore

  def name
    [first_name, last_name].join " "
  end

  %w[age sex weight allergies conditions symptoms].each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("responses @> hstore(?, ?)", key, value) }

    define_method(key) do
      responses && responses[key]
    end

    define_method("#{key}=") do |value|
      self.responses = (responses || {}).merge(key => value)
    end
  end

  def send_text_message
    client_number = "9704450831" #"self.user.phone"

    twilio_sid = ENV["TWILIO_SID"]
    twilio_token = ENV["TWILIO_TOKEN"]
    twilio_phone_number = "7204632120"

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => client_number,
      :body => "#{self.name} has completed their intake form")
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      redirect_to patient_path(@patient)
    else
      find(:all)
      redirect_to patient_path(@patient)
    end
  end
end

