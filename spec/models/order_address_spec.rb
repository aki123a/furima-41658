require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user )
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context 'バリデーションが正しく機能する場合' do
    it "全ての必須項目が正しく入力されていれば保存できること" do
      expect(@order_address).to be_valid
    end

    it "建物名がなくても保存できること" do
      @order_address.address_building = nil
      sleep(1) 
      expect(@order_address).to be_valid
    end
  end

  context 'バリデーションが失敗する場合' do
    it "user_idが空の場合は保存できないこと" do
      @order_address.user_id = nil
      @order_address.valid?
      sleep(1) 
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空の場合は保存できないこと" do
      @order_address.item_id = nil
      @order_address.valid?
      sleep(1) 
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空の場合は保存できないこと" do
      @order_address.token = nil
      @order_address.valid?
      sleep(1) 
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    
    it "郵便番号が空の場合は保存できないこと" do
      @order_address.postal_code = nil
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "郵便番号が不正な形式の場合は保存できないこと" do
      @order_address.postal_code = "1234567"
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "都道府県が空の場合は保存できないこと" do
      @order_address.shipping_area_id = 0
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "市区町村が空の場合は保存できないこと" do
      @order_address.city = nil
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "番地が空の場合は保存できないこと" do
      @order_address.address_banti = nil
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "建物名がなくても保存できること" do
      @order_address.address_building = nil
      sleep(1) 
      expect(@order_address).to be_valid
    end

    it "電話番号が空の場合は保存できないこと" do
      @order_address.phone_number = nil
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "電話番号が不正な形式の場合は保存できないこと" do
      @order_address.phone_number = "090-1234-5678"
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "電話番号が10桁未満の場合は保存できないこと" do
      @order_address.phone_number = "090123456"
      sleep(1) 
      expect(@order_address).to_not be_valid
    end

    it "電話番号が11桁を超える場合は保存できないこと" do
      @order_address.phone_number = "090123456789"
      sleep(1) 
      expect(@order_address).to_not be_valid
    end
  end
end