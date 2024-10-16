FactoryBot.define do
  factory :purchase_address do
    post_code { '111-1111' }
    prefecture_id { 2 }
    city_and_town { 'あ' }
    number { 'あ' }
    tel { '00000000000' }
    token { 'r' }
  end
end

# これ使う
