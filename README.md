## groups テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association
- has_many :users, through: group_users
- has_many :group_users
- has_many :messages

## group_users テーブル
|Column|Type|Option|
|------|----|------|
|group_id|string|null: false, foreign_key: true|
|user_id|string|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## users テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|text|null: false|

### Association
- has_many :groups, through: group_users
- has_many :group_users
- has_many :messages

## messages テーブル

|Column|Type|Option|
|------|----|------|
|message|text|null: false|
|image|text|
|group_id|string|null: false, foreign_key: true|
|user_id|string|null: false, foreign_key: true|

### Association
- belongs_to :groups
- belongs_to :users
