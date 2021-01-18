require 'rails_helper'

RSpec.describe Buyinfo, type: :model do
  before do
    @buyinfo = FactoryBot.build(:buyinfo)
end

  describe "商品購入" do
    context "購入できる時" do
      it "必要事項がすべて入力されている場合" do
        expect(@buyinfo).to be_valid
      end
    end
    context "購入できない時" do
      it "郵便番号が未入力の場合" do
        @buyinfo.postcode = nil
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「郵便番号」を入力してください", "「郵便番号」に無効な文字が使われています")
      end
      it "郵便番号が7桁以外の場合" do
        @buyinfo.postcode = "510-007"
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「郵便番号」に無効な文字が使われています")
      end
      it "郵便番号にハイフンが含まれていない場合" do
        @buyinfo.postcode = "5100074"
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「郵便番号」に無効な文字が使われています")
      end
      it "都道府県が未選択の場合" do
        @buyinfo.prefecture = 0
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「都道府県」をご選択ください")
      end
      it "市区町村が未入力の場合" do
        @buyinfo.city = ""
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「市区町村」を入力してください")
      end
      it "番地が未入力の場合" do
        @buyinfo.street = ""
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「番地」を入力してください")
      end
      it "電話番号にハイフンが含まれている場合" do
        @buyinfo.tel = "090-7546-9806"
        @buyinfo.valid?
        expect(@buyinfo.errors.full_messages).to include("「電話番号」に無効な文字が使われています")
      end
    end
  end
end
