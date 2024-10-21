FactoryBot.define do
  factory :item do

    item_name { Faker::Commerce.product_name } # 商品名として適切なデータ
    explanation { Faker::Lorem.sentence(word_count: 10) } # 説明文として適切なデータ
    category_id { 2 } # カテゴリは有効なIDを指定
    condition_id { 2 } # 条件は有効なIDを指定
    shipping_fee_id { 2 } # 送料は有効なIDを指定
    shipping_area_id { 1 } # 発送地域は有効なIDを指定
    delivery_day_id { 2 } # 配送日数は有効なIDを指定
    price { 3000 } # 適切な価格

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/flag.png'), filename: 'flag.png')
    end
  end
end
