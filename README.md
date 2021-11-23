# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column             | Type         | Options                  |
| ------------------ | ------------ | ------------------------ |
| name               | string       | null: false              |
| explanation        | text         | null: false              |
| category_id        | integer       | null: false             |
| status             | string       | null: false              |
| delivery_fee       | string       | null: false              |
| prefecture_id      | integer       | null: false             |
| delivery_days      | string       | null: false              |
| price              | integer      | null: false              |
| user               | references   | null: false, foreign_key: true             |


### Association

- belongs to :user
- has_one :order


## profiles テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal             | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs to :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :profile