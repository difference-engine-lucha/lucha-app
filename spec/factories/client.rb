FactoryGirl.define do
  factory :confirmed_client, :parent => :client do
      after(:create) { |client| client.confirm! }
  end

  factory :client do
    first_name "Peter"
    last_name "Pan"
    email "peterpan@example.com"
    password "12345678"
    password_confirmation "12345678"
    authorization_and_waiver true
    privacy_policy_authorization true
    ssn "123121234"
    preferred_contact_method "312-555-1212"
    preferred_language "English"
    marital_status "Single"
    dob 19940301
    num_in_household 3
    num_of_dependants 1

    trait :invalid do
      email nil
    end
  end

  
  
end
