# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false, unique: true} |
| encrypted_password  | string | null: false       
| name_kanji_lastname | string | null: false} |
| name_kanji_firstname| string | null: false} |
| name_kana_lastname  | string | null: false} |
| name_kana_firstname | string | null: false} |
| birthday            | date   | null: false |

- has_many :items
- has_one :order

## items テーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| user_id            | references | null: false, foreign_key: true  |
| item_name          | string     | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false  |
| condition_id       | integer    | null: false  |
| shipping_fee_id    | integer    | null: false  |
| shipping_area_id   | integer    | null: false  |
| delivery_days_id   | integer    | null: false  |
| price  | integer   | null: false |

- belongs_to :user
- belongs_to :order

## orders テーブル


| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true | 
| item_id           | references | null: false, foreign_key: true |

- has_one :address
- belongs_to :item
- has_many :users

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order_id         | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address_banti    | string     | null: false                    |
| address_building | string     |                                |
| phone_number     | string     | null: false                    |

- belongs_to :order