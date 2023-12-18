FactoryBot.define do
  factory :coach do
    id                   { SecureRandom.uuid }
    name                 { "John" }
    hourly_rate_in_cents { 10_000 }
  end
end
