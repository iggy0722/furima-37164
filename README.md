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
| birth_year         | string | null: false              |
| birth_month        | string | null: false              |
| birth_day          | string | null: false              |

### Association

- has_many :items
- has_one :profile


## items テーブル

| Column             | Type         | Options                  |
| ------------------ | ------------ | ------------------------ |
| name               | text         | null: false              |
| explanation        | text         | null: false              |
| category           | string       | null: false              |
| status             | string       | null: false              |
| delivery_fee       | string       | null: false              |
| delivery_area      | string       | null: false              |
| delivery_days      | string       | null: false              |
| price              | string       | null: false              |
| user_id            | references   | null: false, foreign_key: true             |


### Association

- belongs to :user


## profiles テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal             | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       |            | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs to :user