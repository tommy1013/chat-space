#user

|column|type|options|
|----|------|-------|
|id|integer|null: false|
|name|string|null: false unique: true|
|E-mail|string|null: false unique: true|
|Password|string|null: false|
##アソシエーション
has_many :thought 中間テーブル
belong_to:


#中間テーブル
|column|type|options|
|---|---|---|
|user_id|integer|null: false　foreign_key: true　add_index|
|group_id|integer|null: false　foreign_key: true　add_index|
##アソシエーション
belogns_to :group
belongs_to :user


#group
|column|type|options|
|---|---|---|
|group_name|string|null: false unique: true|
##アソシエーション
has_many:thougt 中間テーブル
belogns_to :comment


#comments
|column|type|options|
|---|---|---|
|user_id|integer|null: false　foreign_key: true|
|group_id|integer|null: false　foreign_key: true|
|message|text||
|image|string||
##アソシエーション
belogns_to :group
belongs_to :user
