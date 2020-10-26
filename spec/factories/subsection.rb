FactoryBot.define do
  factory :subsection do
    section
    sequence(:section_order, 0)
    description { Faker::Lorem.paragraph }
    track_color { rand(0..5) }
  end
end
