## group テーブル

|Column|Type|Option|
|------|----|------|
|id|integer|null: false, foreign_key: true|
|group_name|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- has_many :users, through: group_users
- has_many :group_users
- has_many :messages

## group_user テーブル
|Column|Type|Option|
|------|----|------|
|id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## user テーブル

|Column|Type|Option|
|------|----|------|
|id|integer|null: false, foreign_key: true|
|user_name|integer|null: false, foreign_key:true|
|email|text|null: false, foreign_key:true|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many :groups, through: group_users
- has_many :group_users
- has_many :messages

## message テーブル

|Column|Type|Option|
|------|----|------|
|id|integer|null: false, foreign_key: true|
|message|text|null: false|
|image|text|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :groups
- belongs_to :users
