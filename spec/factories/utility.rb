FactoryBot.define do
  factory :utility do
    gps_location
    name { Faker::Lorem.word }
    utility_type { :accommodation }
    information { {} }

    trait :with_location do
      location
    end
  end
end
