module FormConditionsHelper
  def form_conditions
    %w(Cancer
      Arthritis
      Celiac
      Dimentia
      IBS
      Anemia
      Crohn's
      AIDS
      Botulism
      Leprosy
      Mumps
      Ulcers
      Tinnitus
      ).map { |c| [c.downcase, c] }
  end

end
