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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| full_name          | string | null: false |
| date_of_birth      | string | null: false |


### Association

- has_many :items
- has_many :shipping address

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| photo              | photo  | null: false |
| condition          | string | null: false |
| category           | string | null: false |
| shipping_fee       | string | null: false |
| explanation        | string | null: false |
| region_of_origin   | string | null: false |
| delivery_time      | string | null: false |
| price              | string | null: false |
| seller             | string | null: false |


### Association

- has_one  :shipping address
- has_many :user

## shipping address テーブル

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| post_code     | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| town          | string | null: false |
| number        | string | null: false |
| building_name | string | null: false |
| tel           | string | null: false |

### Association

- belongs_to :shipping address
- belongs_to :purchase record

## purchase records テーブル

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| item_name     | string | null: false |
| photo         | string | null: false |
| price         | string | null: false |
| shipping_fee  | string | null: false |
| buyer         | string | null: false |

### Association

- has_one  :shipping address
- has_many :user