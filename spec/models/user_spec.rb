require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "usernameが空だと登録できない" do
      @user.username = ""
      @user.valid?
      expect(user.errors.full_messages).to include("名前を入力してください")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(user.errors.full_messages).to include("メールアドレスが入力されていません。")
    end
  end
end