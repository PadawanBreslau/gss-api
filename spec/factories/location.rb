FactoryBot.define do
  factory :location do
    subsection
    gps_location
    sequence(:subsection_order, 0)
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    attraction { false }
  end
end
