FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    explanation { 'a' }
    condition_id { 2 }
    category_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 10_000 }
    user
  end
end
