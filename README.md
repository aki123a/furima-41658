# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false, unique: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } |
| password            | string | null: false, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/} |
| encrypted_password  | string | null: false       
| name_kanji_lastname | string | null: false, format: { with: /\A[^\x01-\x7E]+\z/} |
| name_kanji_firstname| string | null: false, format: { with: /\A[^\x01-\x7E]+\z/} |
| name_kana_lastname  | string | null: false, format: { with: /\A[ァ-ン]+\z/} |
| name_kana_firstname | string | null: false, format: { with: /\A[ァ-ン]+\z/} |
| birthday            | date   | null: false |

- has_many :items

## items テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| user_id            | integer | null: false, foreign_key: true  |
| item_name          | string  | null: false |
| explanation        | text    | null: false |
| category_id        | integer | null: false  |
| condition_id       | integer | null: false  |
| shipping_fee_id    | integer | null: false  |
| shipping_area_id   | integer | null: false  |
| delivery_days_id   | integer | null: false  |
| price  | integer   | null: false |

- belongs_to :user

## orders テーブル


| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | integer    | null: false, foreign_key: true | 
| item_id           | integer    | null: false, foreign_key: true |

- has_one :addresses
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order_id         | integer    | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address_line1    | string     | null: false                    |
| address_line2    | string     |                                |
| phone_number     | string     | null: false                    |

- belongs_to :order