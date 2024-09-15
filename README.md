# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                       | Type   | Options     |
| ---------------------------- | ------ | ----------- |
| name                         | string | null: false |
| email                        | string | null: false, unique: true |
| encrypted_password           | string | null: false |
| last_name                    | string | null: false |
| first_name                   | string | null: false |
| last_name_phonetic_spelling  | string | null: false |
| first_name_phonetic_spelling | string | null: false |
| date_of_birth                | date   | null: false |


### Association

- has_many :items
- has_many :shipping_addresses

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| condition_id     | integer    | null: false |
| category_id      | integer    | null: false |
| shipping_fee_id  | integer    | null: false |
| explanation      | text       | null: false |
| prefecture_id    | integer    | null: false |
| delivery_time_id | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |


### Association

- has_one  :shipping_address
- belongs_to :user

## shipping_addresses テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| post_code           | string     | null: false |
| prefecture_id       | integer    | null: false |
| city                | string     | null: false |
| town                | string     | null: false |
| number              | string     | null: false |
| building_name       | string     |
| tel                 | string     | null: false |
| purchase_record     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- has_one  :shipping_address
- belongs_to :user
- belongs_to :item