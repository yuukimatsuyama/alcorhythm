require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーの新規登録ができる' do
      it '各カラムが正常に入力されれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザーの新規登録ができない' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'passwaordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'sex_idが0では登録できない' do
        @user.sex_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end
      it 'emailは「@」を含まないと登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'emailは「.」を含まないと登録できない' do
        @user.email = 'aaa@ooo'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが8文字以上でなければ登録できない' do
        @user.password = 'a1'
        @user.password_confirmation = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaa1111'
        @user.password_confirmation = 'bbbb1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードがパスワードと一致していません。')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'あああいいい'
        @user.password_confirmation = 'あああいいい'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字のみです。')
      end
    end
  end
end
