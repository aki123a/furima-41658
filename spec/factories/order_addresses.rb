FactoryBot.define do
  factory :order_address do
    postal_code { "123-4567" }
    shipping_area_id { 1 }
    city { "東京都" }
    address_banti { "1-1" }
    phone_number { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }

    # 必要に応じて関連するuserとitemを定義
    association :user
    association :item
  end
end