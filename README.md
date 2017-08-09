
# user

|column|type|options|
|----|------|-------|
|id|integer|null: false|
|name|string|null: false unique: true|
|E-mail|string|null: false unique: true|
|Password|string|null: false|

## アソシエーション
has_many :thought group_user
belongs_to:


# group_user

|column|type|options|
|---|-----|------|
|user_id|integer|null: false　foreign_key: true　add_index|
|group_id|integer|null: false　foreign_key: true　add_index|

## アソシエーション
belongs_to :group
belongs_to :user


# group

|column|type|options|
|---|-----|-----|
|group_name|string|null: false unique: true|

## アソシエーション
has_many:thougt group_user
belogns_to :comment


# comments

|column|type|options|
|---|-----|-----|
|user_id|integer|null: false　foreign_key: true|
|group_id|integer|null: false　foreign_key: true|
|body|text||
|image|string||

## アソシエーション
belongs_to :group
belongs_to :user
