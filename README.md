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

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|seller_id|integer|null: false, foreign_key: { to_table: users}|
|price|integer|null: false|
|purchase|integer|null: false|
|purchase_id|integer|foreign_key: {to_table: users}|
|explanation|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|state_id|integer|null: false|
|brand|string|add_index|
|delivery-fee_id|integer|null: false|
|delivery-are_id|integer|null: false|
|delivery-method_id|integer|null: false|
|shipment_date_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :item_photo
- belongs_to_active_hash
- belongs_to :category



## item_photosテーブル

|Column|Type|Options|
|------|----|-------|
|thumbnail|image|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|profile|text||
|email|string|null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_ruby|string|null: false
|first_name_ruby|string|null: false|
|birthday|date|null: false|

### Association
- has_one :delivery
- has_many :items
- belongs_to :card

## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures_id|integer|null: false|
|municipality|string|null: false|
|address|string|null: false|
|address_detail|string||
|phone_number|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to_active_hash
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user



