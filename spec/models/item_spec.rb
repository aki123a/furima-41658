require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録できる場合' do
    it 'item_name、explanation、category_id、condition_id、shipping_fee_id、shipping_area_id、delivery_day_id、price、imageが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品登録できない場合' do
    # item_nameのテスト
    it 'item_nameが空であれば登録できない' do
      @item.item_name = ''
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    # explanationのテスト
    it 'explanationが空であれば登録できない' do
      @item.explanation = ''
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    # category_idのテスト
    it 'category_idが0の場合は登録できない' do
      @item.category_id = "nil"
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    # condition_idのテスト
    it 'condition_idが0の場合は登録できない' do
      @item.condition_id = "nil"
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    # shipping_fee_idのテスト
    it 'shipping_fee_idが0の場合は登録できない' do
      @item.shipping_fee_id = "nil"
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    # shipping_area_idのテスト
    it 'shipping_area_idが0の場合は登録できない' do
      @item.shipping_area_id = "nil"
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    # delivery_day_idのテスト
    it 'delivery_day_idが0の場合は登録できない' do
      @item.delivery_day_id = "nil"
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    # 価格関連のテスト
    it '価格が300未満であれば登録できない' do
      @item.price = 299
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が9999999を超えていれば登録できない' do
      @item.price = 10000000
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '半角数値以外が含まれている場合登録できない' do
      @item.price = '三千'
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    # imageのテスト
    it 'imageが空であれば登録できない' do
      @item.image = nil
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end