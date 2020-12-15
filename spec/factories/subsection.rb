FactoryBot.define do
  factory :subsection do
    section
    sequence(:section_order, 0)
    description { Faker::Lorem.paragraph }
    track_color { rand(0..5) }

    trait :with_information do
      information { { length: 9.8, ascent: 123, descent: 432 } }
    end
  end
end
