FactoryBot.define do
  factory :section do
    start { Faker::Address.city }
    finish { Faker::Address.city }
    sequence(:order)
    variation { 0 }
  end
end
