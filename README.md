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

| Column      | Type        | Options                       |
| ----------- | ----------  | ----------------------------- |
| itemname    | string      | null:false                    |
| iteminfo    | text        | null:false                    |
| category_id | integer     | null:false                    |
|itemstatus_id| integer     | null:false                    |
| feestatus_id| integer     | null:false                    |
|prefecture_id| integer     | null:false                    |
| delivery_id | integer     | null:false                    |
| price       | integer     | null:false                    |
| user        | references  | null:false, foreign_key: true |

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
| postcode | integer    | null:false                    |
|prefecture| string     | null:false                    |
| city     | string     | null:false                    |
| street   | string     | null:false                    |
| building | string     | null:false                    |
| tel      | integer    | null:false                    |
| order    | references | null:false, foreign_key: true |

### Association
- belongs_to :order