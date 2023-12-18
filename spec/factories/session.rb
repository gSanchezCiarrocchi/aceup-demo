FactoryBot.define do
  factory :session do
    coach
    client
    start { DateTime.current }
    duration { 60 }
  end
end
