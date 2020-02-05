FactoryBot.define do
  factory :product do
    item { Faker::Commerce.product_name}
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
  end
end
