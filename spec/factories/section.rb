FactoryBot.define do
  factory :lap do
    sequence(:number)
    main { true }
  end
end
