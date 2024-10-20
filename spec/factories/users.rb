FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)+"1a"}
    password_confirmation {password}
    name_kanji_firstname  {"てすと"}
    name_kanji_lastname   {"てすと"}
    name_kana_firstname   {"テスト"}
    name_kana_lastname    {"テスト"}
    birthday              {"1962-10-16"}
  end
end