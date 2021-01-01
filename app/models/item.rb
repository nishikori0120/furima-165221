class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :itemname, presence: true
  validates :iteminfo, presence: true
  validates :price, presence: true
  validates :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
end
