FactoryGirl.define do
  factory :patient do
    first_name "Commander"
    last_name "Hadfield"

    factory :invalid_patient do
      first_name nil
      last_name nil
    end
  end
end
