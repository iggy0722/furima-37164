FactoryBot.define do
  factory :user do
    nickname { '小山田' }
    email { Faker::Internet.free_email }
    password { 'aaaa111' }
    password_confirmation { 'aaaa111' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { '1931-02-02' }
  end
end
