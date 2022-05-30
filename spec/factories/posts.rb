FactoryBot.define do
  factory :post do
    name { Faker::Name.name }
    title { Faker::Name.name }
    content { Faker::String.random }

    trait :my_content do
      content { "My content" }
    end
  end
end
