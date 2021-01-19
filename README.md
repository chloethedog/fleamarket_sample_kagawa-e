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

## item_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|explanation|text|null: false|
|state_id|integer|null: false, foreign_key: true, add_index|
|parent_category_id|integer|null: false, foreign_key: true, add_index|
|child_category_id|integer|null: false, foreign_key: true, add_index|
|grandchild_category|integer|null: false, foreign_key: true, add_index|
|size_id|integer|foreign_key: true, add_index|
|bland|string|add_index|

### Association

## item_photsテーブル

|Column|Type|Options|
|------|----|-------|
|thumbnail1|string||
|thumbnail2|string||
|thumbnail3|string||
|thumbnail4|string||
|thumbnail5|string||
|item_id|integer||

### Association

## item_deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|fee|string||
|are|string||
|method|string||
|shipment_date|string||
|item_id|integer||

### Association

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||

### Association


## statesテーブル

|Column|Type|Options|
|------|----|-------|
|state|string||

### Association


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string||
|profile|text||
|mail|string||
|password|string||
|point|integer||

### Association

## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string||
|first_name|string||
|last_name_ruby|string||
|first_name_ruby|string||
|postal_code|string||
|prefectures|string||
|address|string||
|address_detail|string||
|phone_number|integer||
|user_id|integer||

### Association

## personsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

## cardsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

## comments

|Column|Type|Options|
|------|----|-------|

### Association

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|

### Association

## テーブル

|Column|Type|Options|
|------|----|-------|

### Association

## テーブル

|Column|Type|Options|
|------|----|-------|

### Association

## テーブル

|Column|Type|Options|
|------|----|-------|

### Association

## テーブル

|Column|Type|Options|
|------|----|-------|

### Association

