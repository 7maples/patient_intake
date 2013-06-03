module FormSymptomsHelper
  def form_symptoms
    %w(Headaches Fatigue).map { |s| [s.downcase, s] }
  end

end
