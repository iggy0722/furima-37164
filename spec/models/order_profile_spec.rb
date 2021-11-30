require 'rails_helper'

RSpec.describe OrderProfile, type: :model do
  describe '購入情報' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_profile = FactoryBot.build(:order_profile, item_id: :item_id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_profile).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_profile.building = ''
        expect(@order_profile).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postalが空だと保存できないこと' do
        @order_profile.postal = ''
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_profile.postal = '1234567'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'prefecture_idに「---」が選択されている場合は保存できない' do
        @order_profile.prefecture_id = 1
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_profile.municipality = ''
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_profile.address = ''
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_profile.phone_number = ''
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @order_profile.phone_number = '090111122223'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁以内だと保存できないこと' do
        @order_profile.phone_number = '090111122'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberに半角数字以外が含まれている場合は保存できないこと' do
        @order_profile.phone_number = '09011112a'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_profile.token = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_profile.user_id = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_profile.item_id = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
