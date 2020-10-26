FactoryBot.define do
  factory :mezoregion do
    macroregion
    name { Faker::Lorem.word }
  end
end
