FactoryBot.define do
  factory :client do
    id         { SecureRandom.uuid }
    first_name { "John" }
    last_name  { "Doe" }
    email      { "email@email.com" }
  end
end
