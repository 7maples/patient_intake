FactoryGirl.define do
  factory :patient do
    first_name "Jen"
    last_name "Eliuk"

    factory :invalid_patient do
      first_name nil
      last_name nil
    end
  end
end
