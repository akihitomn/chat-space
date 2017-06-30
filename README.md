## groups テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|

### Association
- has_many :users, through: group_users
- has_many :group_users
- has_many :messages

## group_users テーブル
|Column|Type|Option|
|------|----|------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## users テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|
|email|text|null: false, unique: true|

### Association
- has_many :groups, through: group_users
- has_many :group_users
- has_many :messages

## messages テーブル

|Column|Type|Option|
|------|----|------|
|message|text|null: false|
|image|text|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :groups
- belongs_to :users
