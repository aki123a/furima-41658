# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name_kanji         | string | null: false |
| name_kana          | string | null: false |
| birthday           | date   | null: false |

- has_many :items

## items テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| item_name               | string | null: false |
| explanation        | text    | null: false, unique: true |
| detail             | string  | null: false |
| delivery           | string  | null: false |
| price              | integer | null: false |