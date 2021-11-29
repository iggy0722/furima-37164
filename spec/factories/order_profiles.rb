FactoryBot.define do
  factory :order_profile do
    postal { "123-4567" }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { "09011112222" }
  end
end
