module FormSymptomsHelper
  def form_symptoms
    %w(Headaches
      Fatigue
      Pain
      Nausea
      Cough
      Rash
      Swelling
      ).map { |s| [s.downcase, s] }
  end

end
