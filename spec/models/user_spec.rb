require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation,name_kanji_firstname,name_kanji_lastname,name_kana_firstname,name_kana_lastname,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がない場合登録できない' do
        @user.email = 'invalid_email_without_atmark'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it 'passwordが英数字両方含まれていない場合登録できない' do
        @user.password = 'abcdef' # 英字のみ
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") # バリデーションエラーメッセージを確認
      end
      
      it 'passwordが英数字両方含まれていない場合登録できない' do
        @user.password = '123456' # 数字のみ
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") # バリデーションエラーメッセージを確認
      end

      it 'name_kanji_firstnameが空では登録できない' do
        @user.name_kanji_firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji firstname can't be blank")
      end

      it 'name_kanji_firstnameがカナや英数字の場合登録できない' do
        @user.name_kanji_firstname = 'カナ123' # カナと数字を含む
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji firstname is invalid") # バリデーションエラーメッセージを確認

        @user.name_kanji_firstname = 'abc' # 英字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji firstname is invalid") # バリデーションエラーメッセージを確認

        @user.name_kanji_firstname = 'カナ' # カナのみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji firstname is invalid") # エラーが出ないことを確認
      end

      it 'name_kanji_lastnameが空では登録できない' do
        @user.name_kanji_lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji lastname can't be blank")
      end

      it 'name_kanji_lastnameがカナや英数字の場合登録できない' do
        @user.name_kanji_lastname = 'カナ123' # カナと数字を含む
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji lastname is invalid") # バリデーションエラーメッセージを確認

        @user.name_kanji_lastname = 'abc' # 英字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji lastname is invalid") # バリデーションエラーメッセージを確認

        @user.name_kanji_lastname = 'カナ' # カナのみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji lastname is invalid") # エラーが出ないことを確認
      end

      it 'name_kana_firstnameが空では登録できない' do
        @user.name_kana_firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana firstname can't be blank")
      end

      it 'name_kana_firstnameが漢字や英数字の場合登録できない' do
        @user.name_kana_firstname = '漢字' # 漢字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana firstname is invalid") # エラーメッセージを確認
      
        @user.name_kana_firstname = '123' # 数字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana firstname is invalid") # エラーメッセージを確認
      
        @user.name_kana_firstname = 'abc' # 英字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana firstname is invalid") # エラーメッセージを確認
      
      end

      it 'name_kana_lastnameが空では登録できない' do
        @user.name_kana_lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana lastname can't be blank")
      end

      it 'name_kana_lastnameが漢字や英数字の場合登録できない' do
        @user.name_kana_lastname = '漢字' # 漢字
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana lastname is invalid") # エラーメッセージを確認
      
        @user.name_kana_lastname = '123' # 数字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana lastname is invalid") # エラーメッセージを確認
      
        @user.name_kana_lastname = 'abc' # 英字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana lastname is invalid") # エラーメッセージを確認
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
  context 'ログインできない場合' do
    it '間違ったemailではログインできない' do
      user = FactoryBot.create(:user)
      expect(User.find_for_database_authentication(email: 'wrong@example.com')).to be_nil
    end

    it '間違ったpasswordではログインできない' do
      user = FactoryBot.create(:user)
      expect(user.valid_password?('wrongpassword')).to be false # 間違ったパスワードでログイン不可
    end
  end
end
