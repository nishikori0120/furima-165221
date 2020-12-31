require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "usernameとemail,passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "usernameが6文字以下であれば登録できる" do
        @user.username = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "usernameが空だと登録できない" do
        @user.username = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。")
      end
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが入力されていません。")  
      end
      it "名前が21文字以上だと登録できない"do
        @user.username = "abcdefghijkmnlopqrstu"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は20文字以内で入力してください")
      end
      it "重複したメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスは既に使用されています。")
      end
      it "パスワードと確認用欄が一致していない場合、登録できない" do
        @user.password = "123456"
        @user.password_confirmation ="123457"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it "パスワードが5文字以下だと登録できない" do
        @user.password = "12345"
        @user.password_confirmation ="12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上に設定して下さい。")
      end
    end
  end
end