FactoryBot.define do
  factory :item do
    itemname              {Faker::Games::Pokemon.name}
    iteminfo              {Faker::Lorem.sentence}
    category_id           {2}
    itemstatus_id         {2}
    feestatus_id          {2}
    prefecture_id         {2}
    delivery_id           {2}
    price                 {1000}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
