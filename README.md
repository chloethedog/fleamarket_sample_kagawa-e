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
|seller_id|integer|null: false, foreign_key: true|
|price|integer|null: false, add_index|
|purchase|integer|null: false, add_index|
|purchase_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item_detail
- belongs_to :item_phots
- belongs_to :item_delivery
- has_many :comments
- has_many :favorites


## item_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|explanation|text|null: false|
|state_id|integer|null: false, foreign_key: true, add_index|
|parent_category_id|integer|null: false, foreign_key: true, add_index|
|child_category_id|integer|null: false, foreign_key: true, add_index|
|grandchild_category|integer|foreign_key: true, add_index|
|size_id|integer|foreign_key: true, add_index|
|bland|string|add_index|

### Association
- belongs_to :item
- belongs_to :category
- belongs_to :state

## item_photsテーブル

|Column|Type|Options|
|------|----|-------|
|thumbnail1|string|null: false|
|thumbnail2|string||
|thumbnail3|string||
|thumbnail4|string||
|thumbnail5|string||
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## item_deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|fee|string|null: false, add_index|
|are|string|null: false|
|method|string|null: false|
|shipment_date|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|add_index|

### Association
- has_many :items

## statesテーブル

|Column|Type|Options|
|------|----|-------|
|state|string|null: false|

### Association
- has_many :items

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|profile|text||
|mail|string|null: false, add_index, unique: true|
|password|string|null: false|
|point|integer|null: false|

### Association
- belongs_to :person
- belongs_to :delivery
- has_many :items
- has_many :cards
- has_many :comments
- has_many :favorites

## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_ruby|string||null: false
|first_name_ruby|string|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|address_detail|string||
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## personsテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_ruby|string|null: false|
|first_name_ruby|string|null: false|
|birthday|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## comments

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

