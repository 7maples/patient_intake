module FormConditionsHelper
  def form_conditions
    %w(Cancer Arthritis).map { |c| [c.downcase, c] }
  end

end
