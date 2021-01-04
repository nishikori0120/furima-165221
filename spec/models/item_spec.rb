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
        binding.pry
        # expect(@item.errors.full_messages).to include("") 
      end
    end
  end
end
