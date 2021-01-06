require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品新規登録" do
    context "登録できる時" do
      it "全項目入力している場合、登録できる" do
        expect(@item).to be_valid
      end
    end
    context "登録できない時" do
      it "画像が選択されていない場合、登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("「出品画像」が選択されておりません。") 
      end
      it "「商品の名前」が入力されていない場合、登録できない" do
        @item.itemname = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("「商品名」が入力されておりません。") 
      end
      it "「商品の説明」が入力されていない場合、登録できない" do
        @item.iteminfo = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("「商品の説明」が入力されておりません。") 
      end
      it "「カテゴリー」が選択されていない場合、登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryが未選択です。ご確認の上、再度選択をしてください。") 
      end
      it "「商品の状態」が選択されていない場合、登録できない" do
        @item.itemstatus_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemstatusが未選択です。ご確認の上、再度選択をしてください。") 
      end
      it "「配送料の負担」が選択されていない場合、登録できない" do
        @item.feestatus_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Feestatusが未選択です。ご確認の上、再度選択をしてください。") 
      end
      it "「発送元の地域」が選択されていない場合、登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectureが未選択です。ご確認の上、再度選択をしてください。") 
      end
      it "「発送までの日数」が選択されていない場合、登録できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryが未選択です。ご確認の上、再度選択をしてください。") 
      end
      it "「価格」が入力されていない場合、登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("「価格」が入力されておりません。") 
      end
      it "「商品名」が40文字以上だった場合、登録できない" do
        @item.itemname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("「商品名」は40文字以下に設定して下さい。") 
      end
      it "「商品の説明」が1000文字以上だった場合、登録できない" do
        @item.iteminfo = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("「商品の説明」は1000文字以下に設定して下さい。") 
      end
      it "「価格」が300円未満だった場合、登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("「価格」は300円以上にしてください") 
      end
      it "「価格」が10,000,000円以上だった場合、登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("「価格」は9999999以下の値にしてください") 
      end
    end
  end
end
