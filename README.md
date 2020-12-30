## Users

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| username | string | null:false |
| email    | string | null:false |
| password | string | null:false |

### Association
- has_many :items
- has_many :order

## Items

|Column       |Type        |Options                        |
| ----------- | ---------- | ----------------------------- |
| itemname    |string      | null:false                    |
| category_id |integer     | null:false                    |
| price       |integer     | null:false                    |
| user        |references  | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## Orders

|Column| Type       | Options                       |
| ---- | ---------- | ----------------------------- |
| user | references | null:false, foreign_key: true |
| item | references | null:false, foreign_key: true |

### Association
- belongs_to :items
- has_one : addresses

## Addresses

|Column|Type|Options|
| ------   | ---------- | ----------------------------- |
| address  | string     | null:false                    |
| buy      | references | null:false, foreign_key: true |

### Association
- belongs_to :order