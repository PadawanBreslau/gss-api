FactoryBot.define do
  factory :trivium do
    content { Faker::Lorem.sentence }

    trait :subsection do
      triviable { create(:subsection) }
    end

    trait :gps_location do
      gps_location
    end
  end
end
